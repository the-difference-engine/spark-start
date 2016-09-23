class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

def index
  @user = session[:userinfo]
end

def show
end

end
