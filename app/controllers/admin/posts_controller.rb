class Admin::PostsController < ApplicationController
  before_action :set_current_user 
  before_action :authenticate_admin!
  
  def new
    @post = Post.new
  end

  def create
    params[:post] ||= []
    @post = Post.new(post_params)

    if @post.save
      flash[:success]= "Post created!"
      redirect_to admin_path
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update(post_params)
      flash[:success]= "Post has been successfully updated."
      redirect_to admin_path
      else
        render :edit
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    
    if @post.destroy
      flash[:success]= "Post has been successfully deleted."
      redirect_to admin_path
      else
        render :index
    end
  end

private

  def post_params
	   params.require(:post).permit(:title, :body, :author, :user_id)
  end

end
