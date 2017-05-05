# == Schema Information
#
# Table name: author_categories
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :author_category do
    
  end
end
