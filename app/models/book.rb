# == Schema Information
#
# Table name: books
#
#  id                 :integer          not null, primary key
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#  title              :string
#  description        :text
#  ebook_file_name    :string
#  ebook_content_type :string
#  ebook_file_size    :integer
#  ebook_updated_at   :datetime
#

class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  #has_many :authors_books
  has_many :categories_author_books
  has_many :authors
  has_many :categories, through: :categories_author_books
  #has_many :authors, through: :authors_books
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ 
  has_attached_file :ebook, styles: {thumbnail: "60x60"}
  validates_attachment :ebook, content_type: { content_type: "application/pdf" }

def authors_names
  self.authors.map { |authors| authors.full_name }  

  # authors = Author.where(book_id = book)

  # authors.each do |author|
    
  # end
end


end
