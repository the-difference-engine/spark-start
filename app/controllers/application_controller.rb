class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return unless session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"]
    @current_user ||= User.find(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end

  private

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      # Redirect to page that has the login here
      redirect_to '/'
    end
  end
end
