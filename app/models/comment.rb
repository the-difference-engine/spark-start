class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :book, foreign_key: :commentable_id
  has_many :comments, foreign_key: :commentable_id
end
