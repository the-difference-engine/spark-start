class CommentsController < ApplicationController

  def create
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    if params[:post_id]
      @post = Post.find(params[:post_id])

    end
    @comment = Comment.create(
      body: params[:body],
      book_id: params[:book_id]
    )

    redirect_to request.referer
  end

end
