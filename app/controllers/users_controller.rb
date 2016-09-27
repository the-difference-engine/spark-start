class UsersController < ApplicationController
	before_filter :logged_in_using_omniauth?

	before_action :is_profile_created

	def index
		@users = User.all
		@profiles = Profile.all
	end

<<<<<<< e1f8c1d12567e7581b7e301a425438e5cc10b7a0
	private

	def is_profile_created
	  @current_user = User.find_by_email(session[:userinfo]["extra"]["raw_info"]["email"])
	  if !@current_user.profile.present?
	    render "new"
	  end
	end

=======
>>>>>>> attempt to add commenter user name
end
