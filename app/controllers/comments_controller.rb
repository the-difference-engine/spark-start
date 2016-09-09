class CommentsController < ApplicationController

  def create
    @comment = Comment.create(
      body: params[:body],
      post_id: params[:post_id]
    )
  end
end
