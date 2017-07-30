# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_name   :string
#

FactoryGirl.define do
  factory :tag do
    name "MyString"
  end
end
