class CommentsController < ApplicationController

  def create
    @comment = Comment.create(
      body: params[:body],
      post_id: params[:post_id]
    )

    redirect_to request.referer
  end
end
