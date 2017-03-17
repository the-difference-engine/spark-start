# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  experience         :integer
#  bio                :text
#  phone              :string
#  career             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  first_name         :string
#  last_name          :string
#  state              :string
#  city               :string
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

FactoryGirl.define do
  factory :profile do
    first_name 'John'
    last_name 'Doe'
    career 'Educaiton'
    experience 10
    bio 'this is the bio'
    phone '1231231234'
    image nil
    city 'chicago'
    state 'il'
  end
end
