class PostsController < ApplicationController

def index
  @user = session[:userinfo]
end

def show
end


end
