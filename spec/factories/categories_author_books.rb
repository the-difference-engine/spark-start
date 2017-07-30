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

FactoryGirl.define do
  factory :categories_author_book do
    
  end
end
