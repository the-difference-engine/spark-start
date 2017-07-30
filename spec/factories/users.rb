# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  admin      :boolean          default("false")
#

FactoryGirl.define do
    factory :user do
      email 'justinviegelahn@gmail.com'
      token 'abc123'
      # password 'secret'
      # password_confirmation 'secret'
      admin true
    end
end
