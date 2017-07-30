# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :categorized_posts
  has_many :posts, through: :categorized_posts
  has_many :categories_author_books
  has_many :books
  has_many :books, through: :categories_author_books
  has_many :author_categories
  has_many :authors, through: :author_categories
end
