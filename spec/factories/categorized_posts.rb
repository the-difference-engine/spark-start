# == Schema Information
#
# Table name: categorized_posts
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :categorized_post do
    post_id 1
    category_id 1
  end
end
