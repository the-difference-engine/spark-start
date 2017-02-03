class CommentsController < ApplicationController

  def new
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    @comment = Comment.new
    @book = Book.new
  end

  def create
    @user_session = session[:userinfo]
    @user_token = @user_session["extra"]["raw_info"]["identities"][0]["user_id"]
    @comment = Comment.new(
      body: params[:body],
      commentable_id: params[:commentable_id],
      commentable_type: params[:commentable_type]
    )

  if @comment.save
      redirect_to request.referer
  else
    render 'new.html.erb'
  end
  end

end
