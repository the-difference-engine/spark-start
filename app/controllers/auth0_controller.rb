class Auth0Controller < ApplicationController
  def callback
    
    session[:userinfo] = request.env['omniauth.auth']
    user_info = session[:userinfo]
    
    params[:token] = user_info.credentials["token"]
    params[:email] = user_info.info["email"]

    users = User.all
    if users.find_by_email(params[:email]).nil?
      new_user
    else
      redirect_to blogs_path
    end
    
  end

  def new_user
      @user = User.new(user_params) 
      if @user.save
        flash[:success] = "Welcome To Spark Start"
        redirect_to profile_new_path
      else
        flash[:error] = "Try Again"
        render root
      end
  end

  def logout
    session[:userinfo] = nil
    redirect_to "https://sparkstart.auth0.com/v2/logout?returnTo=http://localhost:3000"
  end


  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  private

    def user_params
      params.permit(:token, :email)
    end

end
