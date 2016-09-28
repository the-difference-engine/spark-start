class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

def index
  @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  @user = session[:userinfo]
end

def show
end

end
