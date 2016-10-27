class UsersController < ApplicationController
	before_filter :logged_in_using_omniauth?

	before_action :is_profile_created

	def index
		@users = User.all
		@profiles = Profile.all
	end

	private

	def is_profile_created
	  @current_user = User.find_by_email(session[:userinfo]["extra"]["raw_info"]["email"])
	  if !@current_user.profile
	    render "new"
	  end
	end

end
