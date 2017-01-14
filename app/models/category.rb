class Category < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :categorized_posts
  has_many :posts, through: :categorized_posts
  has_many :categories_author_books
  has_many :books
  has_many :books, through: :categories_author_books
  has_many :authors
  has_many :author, through: :author_categories
end
