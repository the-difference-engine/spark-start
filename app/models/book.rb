class Book < ApplicationRecord

  belongs_to :user
  has_attached_file :book
  validates_attachment_content_type :book, :content_type => ['application/pdf']
  
end
