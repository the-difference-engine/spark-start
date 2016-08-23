class ProfilesController < ApplicationController

def index
end

def show
  @profile = Profile.find(params[:id])
end

def new
end

def create
  @profile = Profile.create(
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

def edit
  @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])
  Profile.update(
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

end

