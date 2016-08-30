class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @user = session[:userinfo]
  end

  def show

  end

  def new

  end

  def create
    @post = Post.new(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      tags: params[:tags],
      user_id: @user.uid
    )
  end

  def edit

  end

  def update

  end

  def destroy

<<<<<<< 88615f42fa744b69ea989bf1b627626854fad9b5
=======
  end

>>>>>>> Add new joint table CategorizedProducts
end
