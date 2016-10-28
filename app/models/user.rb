class User < ApplicationRecord

  # has_many :posts
  has_many :chats
  has_one :profile

end
