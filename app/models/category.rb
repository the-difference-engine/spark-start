class Category < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :categorized_posts
  has_many :posts, through: :categorized_posts

  has_many :posts

end
