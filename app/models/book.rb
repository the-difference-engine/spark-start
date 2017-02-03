class Book < ApplicationRecord

  belongs_to :user
  has_many :comments, foreign_key: :commentable_id
  
end
