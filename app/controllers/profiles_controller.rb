class ProfilesController < ApplicationController
  before_action :is_profile_created, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :set_current_user
  include ProfilesHelper

  def index
  end

  def show
    @profile = Profile.find(@current_user.profile.id)
  end

  def new
  end

  def create
    current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    user_id = current_user.id
    @profile = Profile.create!(profile_params)
    redirect_to "/profile/#{@profile.id}"
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success]= "Profile updated!"
      redirect_to "/profile/#{@profile.id}"
    else
      render :edit
    end
  end

  def destroy
  # What does this do? Where does this get called?
    @profile = Profile.find(params[:id])
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
  
  def profile_params
    params.require(:profile).permit(:experience,:bio,:phone, :career, :image, :first_name, :last_name, :city, :state)
  end
end
