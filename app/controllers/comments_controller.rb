class CommentsController < ApplicationController

  def create
    # @book = Book.find(params[:book_id])
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    @comment = Comment.new comment_params
    @comment.save


    redirect_to request.referer
  end

  def comment_params
    params.permit(:body, :commentable_id, :commentable_type, :approved)
  end
end
