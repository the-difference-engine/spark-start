class CommentsController < ApplicationController

  def create
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    @post = Post.find(params[:post_id])
    @comment = Comment.create(
      body: params[:body],
      post_id: @post.id,
      user_id: @user_token
    )

    redirect_to request.referer
  end

end
