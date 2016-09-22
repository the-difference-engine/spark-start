class HomesController < ApplicationController

def index
  @user = session[:userinfo]
end

def theme

end

end
