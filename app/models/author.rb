# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#

class Author < ApplicationRecord
	#has_many :authors_books
	has_many :author_categories
	belongs_to :book
	has_many :categories, through: :author_categories
	#has_many :categories_author_books
	#has_many :categories, through: :categories_author_books
end
