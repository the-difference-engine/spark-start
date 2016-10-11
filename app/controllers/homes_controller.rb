class HomesController < ApplicationController

def index
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
    #@user = session[:userinfo]

  @posts = Post.all.sort_by(&:created_at).take(3)

end

def theme

end

end
