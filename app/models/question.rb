class Question < ApplicationRecord
  belongs_to :book
  has_many :comments, as: :commentable
end
