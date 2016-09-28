class HomesController < ApplicationController

def index
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
    #@user = session[:userinfo]
end

def theme

end

end
