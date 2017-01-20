class Auth0Controller < ApplicationController
  def callback

    session[:userinfo] = request.env['omniauth.auth']
    user_info = session[:userinfo]

    params[:token] = session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"]
    params[:email] = user_info.info["email"]

    users = User.all
    # if users.has_email?
    #   redirect_to root_path
    # else
    #   new_user
    # end
    if users.has_email(params[:email])
      new_user
    else
      redirect_to root_path
    end

  end

  def new_user
      @user = User.new(user_params)
      if @user.save
        UserNotifierMailer.send_signup_email(@user).deliver
        flash[:success] = "Welcome To Spark Start"

        redirect_to profile_new_path
      else
        flash[:error] = "Try Again"
        render root
      end
  end

  def logout
    session[:userinfo] = nil
    redirect_to "/"
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
