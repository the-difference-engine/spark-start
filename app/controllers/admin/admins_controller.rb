class Admin::AdminsController < ApplicationController
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
    @books = Book.all
    @users = User.all
  end

  def show
  end
end
