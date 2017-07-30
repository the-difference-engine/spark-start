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

FactoryGirl.define do
  factory :author do
    
  end
end
