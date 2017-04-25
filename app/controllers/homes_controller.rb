class HomesController < ApplicationController

def index
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end


end

def how
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end

def mission
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end

def videos
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end

def theme
  # delete this code, only for review

end

end
