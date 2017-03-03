class Comment < ApplicationRecord
  validates :body, presence: true

  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true
  belongs_to :user, optional: true
end
