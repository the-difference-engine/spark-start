class Admin::AdminsController < ApplicationController
  # before_filter :logged_in_using_omniauth?
  before_action :set_current_user
  before_action :authenticate_admin!

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @posts = Post.all
    @books = Book.order(created_at: :desc)
    @users = User.all
  end

  def show
  end


end
