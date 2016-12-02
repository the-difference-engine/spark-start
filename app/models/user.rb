class User < ApplicationRecord

  # has_many :posts
  has_many :chats
  has_one :profile

  def self.has_email(email)
    User.find_by_email(email).nil?
  end

end
