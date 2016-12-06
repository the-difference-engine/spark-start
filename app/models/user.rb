class User < ApplicationRecord

  # has_many :posts
  has_many :chats
  has_one :profile

  def self.find_user
    find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end
