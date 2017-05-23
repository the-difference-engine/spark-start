class ErrorsController < ApplicationController
  def routing
    redirect_to '/'
    flash[:warning] = "The page you requested does not exist"
  end
end
