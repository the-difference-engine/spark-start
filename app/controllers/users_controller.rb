class UsersController < ApplicationController
	before_filter :logged_in_using_omniauth?

	def index
		@users = User.all
		@profiles = Profile.all
	end
end

