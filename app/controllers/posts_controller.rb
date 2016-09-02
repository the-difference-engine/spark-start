class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @user = session[:userinfo]
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new

  end

  def create
    @user = session[:userinfo]
    @post = Post.create(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      tags: params[:tags],
      user_id: params[:user_id],
      category_id: params[:category_id]
    )
    redirect_to "/blog/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      tags: params[:tags],
      user_id: @user[:user_id]
    )
    redirect_to "/blog/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/blog/"
  end

end
