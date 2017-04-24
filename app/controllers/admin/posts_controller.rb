class Admin::PostsController < ApplicationController

def new
end

def create
end

def edit
	@post = Post.find_by_id(params[:id])
end

def update
	@post = Post.find_by_id(params[:id])
    # @user = session[:userinfo]
    if @post.update(post_params)
      flash[:success]= "Post has been successfully updated."
      redirect_to admin_path
    else
      render :edit
    end
end

def destroy
end

private

def post_params
	params.require(:post).permit(:title, :body, :author, :user_id)
end

end
