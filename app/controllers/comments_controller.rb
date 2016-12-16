class CommentsController < ApplicationController
  before_action :set_post
  def new
    @comment = Comment.new
  end

  def create
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    @comment = Comment.create(comment_params)
    @comment.post_id = @post.id

    redirect_to blog_path
  end

  private
  
  def set_post
    @post =Post.find(params[:comment][:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
