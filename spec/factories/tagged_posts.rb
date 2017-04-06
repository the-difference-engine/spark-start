# == Schema Information
#
# Table name: tagged_posts
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :tagged_post do
    post_id 1
    tag_id 1
  end
end
