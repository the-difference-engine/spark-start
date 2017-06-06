
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      # Redirect to page that has the login here
      redirect_to '/'
    end
  end

end
