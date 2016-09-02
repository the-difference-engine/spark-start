class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP

    session[:userinfo] = request.env['omniauth.auth']
    @userinfo = session[:userinfo]

    if @userinfo["logins_count"] == 1
      self.new_user
    else

    end


    # Redirect to the URL you want after successfull auth
    redirect_to '/blogs'
  end

  # def user
  #   @user = session[:userinfo]
  # end

  def logout
    session[:userinfo] = nil
    redirect_to "https://sparkstart.auth0.com/v2/logout?returnTo=http://localhost:3000"
  end


  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

  Private

    def new_user
      @user = User.create(
        token: params[:token],
        user_id: params[:user_id]
        )
    end

end
