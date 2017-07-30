# == Schema Information
#
# Table name: categories_author_books
#
#  id          :integer          not null, primary key
#  book_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategoriesAuthorBook < ApplicationRecord
  belongs_to :book
  belongs_to :category
end
