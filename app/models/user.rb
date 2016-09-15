class User < ApplicationRecord

  has_many :comments
  has_many :posts
  has_many :chats
  has_many :profiles

end
