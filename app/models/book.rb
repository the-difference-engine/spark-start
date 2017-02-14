class Book < ApplicationRecord
  belongs_to :user
  #has_many :authors_books
  has_many :categories_author_books
  has_many :authors
  has_many :categories, through: :categories_author_books
  #has_many :authors, through: :authors_books
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/ 
  has_attached_file :ebook, styles: {thumbnail: "60x60"}
  validates_attachment :ebook, content_type: { content_type: "application/pdf" }
end
