class ErrorsController < ApplicationController
  def redirect_bad_url
    redirect_to '/'
    flash[:warning] = "The page you requested does not exist"
  end
end
