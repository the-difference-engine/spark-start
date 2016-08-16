class ProfilesController < ApplicationController

def index
end

def show
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
    user_id: params[:user_id]
    )
end

def edit
  # @profile = Profile.find_by(:id params[:id])
end

def update
  # @profile = Profile.find_by(:id params[:id])
  # Profile.update(
  #   experience: params[:experience],
  #   bio: params[:bio],
  #   phone: params[:phone],
  #   career: params[:career],
  #   image: params[:image],
  #   user_id: params[:user_id]
  #   )
end

def destroy
  # @profile = Profile.find_by(:id params[:id])
  # @profile.destroy
end

end
