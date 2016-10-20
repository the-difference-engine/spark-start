class ProfilesController < ApplicationController

  before_action :is_profile_created

  include ProfilesHelper

def index

end

def show
  @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  @profile = Profile.find_by_user_id(params[:id])
end

def new
  @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  @states = us_states
end

def create

  current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  params[:user_id] = current_user.id
  @profile = Profile.create!(
    experience: params[:experience],
    bio: params[:bio],
    phone: params[:phone],
    career: params[:career],
    image: params[:image],
    user_id: params[:user_id],
    first_name: params[:first_name],
    last_name: params[:last_name],
    city: params[:city],
    state: params[:state]
    )
  redirect_to "/profile/#{current_user.id}"
end

def edit
  @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])
  @profile.update(
    experience: params[:experience],
    bio: params[:bio],
    phone: params[:phone],
    career: params[:career],
    image: params[:image],
    user_id: params[:user_id],
    first_name: params[:first_name],
    last_name: params[:last_name],
    city: params[:city],
    state: params[:state]
    )
  redirect_to "/profile/#{@profile.id}"
end

def destroy
  @profile = Profile.find(params[:id])
  @profile.destroy
end

private

def is_profile_created
  @current_user = User.find_by_email(session[:userinfo]["extra"]["raw_info"]["email"])
  if !@current_user.profile.present?
    render "new"
  end
end

end
