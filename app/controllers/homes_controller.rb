class HomesController < ApplicationController

def index
  @user = session[:userinfo]
end

end
