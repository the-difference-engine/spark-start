class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  end 

  def edit
   @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
   if @user.update(user_params)
      flash[:success]= ("User has been successfully updated.")
      redirect_to admin_path
    else
      flash[:failure]= "User info does not exist."
    end
  end

  def destroy
  @user = User.find_by_id(params[:id])
   if @user.destroy
      flash[:success]= ("User has been successfully deleted.")
      redirect_to admin_path
    else
      flash[:failure]= "User info does not exist."
    end
  end


private

def user_params
  params.require(:user).permit(:email, :admin)
end
end

