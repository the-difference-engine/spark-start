class User < ApplicationRecord

  # has_many :posts
  has_many :chats
  has_one :profile, dependent: :destroy 
  has_many :books

  def self.has_email(email)
    User.find_by_email(email).nil?
  end

end
