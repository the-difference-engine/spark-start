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

class User < ApplicationRecord

  # has_many :posts
  has_many :chats
  has_many :comments
  has_many :books
  has_one :profile, dependent: :destroy 

  def self.has_email(email)
    User.find_by_email(email).nil?
  end

  def admin?
  	self.admin
  end

end
