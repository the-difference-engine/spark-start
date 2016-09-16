class CommentsController < ApplicationController

  def create
    @user = session[:userinfo]
    @post = Post.find(params[:id])
    @comment = Comment.create(
      body: params[:body],
      post_id: @post.id,
      user_id: @user["extra"]["raw_info"]["identities"][0]["user_id"]
    )

    redirect_to request.referer
  end
end
