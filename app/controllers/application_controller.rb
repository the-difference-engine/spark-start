class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  def set_current_user
       @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end

private

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      # Redirect to page that has the login here
      redirect_to '/'
    end
  end

  def authenticate_admin!
    redirect_to '/' unless @current_user && @current_user.admin
  end



end
