class ProfilesController < ApplicationController
  before_action :is_profile_created, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :set_current_user
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  include ProfilesHelper

  def index
  end

  def show
  end

  def new
  end

  def create
    current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    user_id = current_user.id
    @profile = Profile.create!(profile_params)
    #experience: params[:experience],
    #bio: params[:bio],
    #phone: params[:phone],
    #career: params[:career],
    #image: params[:image],
    #user_id: user_id,
    #first_name: params[:first_name],
    #last_name: params[:last_name],
    #city: params[:city],
    #state: params[:state]
    #)
    redirect_to @profile
  end

  def edit
  end

  def update
    params[:profile]
    if @profile.update(profile_params)
      flash[:success]= "Profile updated!"
      redirect_to @profile
    else
      render :edit 
    end
  end

  def destroy
  # What does this do? Where does this get called?
    @profile.destroy
  end

 private

  def is_profile_created
    @current_user = User.find_by_email(session[:userinfo]["extra"]["raw_info"]["email"])
    if !@current_user.profile
      render "new"
    end
  end

  def set_current_user
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end

  def set_profile
    @profile = Profile.find(@current_user.profile.id)
  end

  def profile_params
    params.require(:profile).permit(:experience, :bio, :phone, :career, :image, :first_name, :last_name, :city, :state)
  end
end
