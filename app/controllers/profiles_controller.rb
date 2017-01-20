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
    @profile= Profile.new
  end

  def create
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    params[:profile][:user_id] = @current_user.id
    @profile = Profile.new(profile_params)
    if @profile.save!
      flash[:success]= "Profile created!"
      redirect_to @profile
    end
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
    @profile.destroy
    flash[:success]= "Profile was successfully destroyed."
    redirect_to @profiles
  end

 private

  def is_profile_created
    @current_user = User.find_by_email(session[:userinfo]["extra"]["raw_info"]["email"])
    if !@current_user.profile
      #redirect_to new_profile_path
    end
  end

  def set_current_user
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end

  def set_profile
    @profile = Profile.find(@current_user.profile.id)
  end

  def profile_params
    params.require(:profile).permit(:experience, :bio, :phone, :career, :image, :first_name, :last_name, :city, :user_id, :state)
  end
end
