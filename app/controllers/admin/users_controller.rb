class Admin::UsersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update

  @user = User.find_by_id(params[:id])
   if @user.update(user_params)
      flash[:success]= ("User has been successfully updated.")
      redirect_to '/admin/admins/index'
    else
      flash[:failure]= "User info does not exist."
    end
  end

  def destroy
  end

  def index
  end

  def show
  end


private

def user_params
  params.require(:user).permit(:email, :admin)
end
end

