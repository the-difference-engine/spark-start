class HomesController < ApplicationController

def index
  @user = session[:userinfo]
  @posts = Post.all.sort_by(&:created_at).take(3)
end

def theme

end

end
