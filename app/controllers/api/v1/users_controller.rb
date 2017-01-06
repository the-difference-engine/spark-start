class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jbuilder"
  end

  def update
    user = User.find(params(:id))
    user.update(admin: params(:admin))
  end
end
