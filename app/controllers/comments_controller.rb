class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(
      body: params[:body],
      post_id: @post.id,
    )

    redirect_to request.referer
  end

end
