class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  #has_many :authors_books
  has_many :categories_author_books
  has_many :authors
  has_many :categories, through: :categories_author_books
  #has_many :authors, through: :authors_books
  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/, message: " must be an image file."
  has_attached_file :ebook, styles: {thumbnail: "60x60"}
  validates_attachment :ebook, content_type: { content_type: "application/pdf", message: "file must be a pdf." }
  after_validation :clean_paperclip_errors

  def pdf_exists?
    if self.ebook.url == "/ebooks/original/missing.png"
      return "Not Available."
    else
      return self.ebook.url
    end
  end

  def authors_names
   self.authors.map { |authors| authors.full_name }  
 
   # authors = Author.where(book_id = book)
 
   # authors.each do |author|
     
   # end
  end

  def check_downloads
    self.book_downloads >= self.max_downloads
  end

  def clean_paperclip_errors
    errors.delete(:cover)
    errors.delete(:ebook_content_type)
  end


end
