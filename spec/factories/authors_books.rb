# == Schema Information
#
# Table name: authors_books
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :authors_book do
    
  end
end
