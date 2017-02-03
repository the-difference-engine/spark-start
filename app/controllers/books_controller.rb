class BooksController < ApplicationController
  before_filter :logged_in_using_omniauth?

def index
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
  @books = Book.all
end

def show
  if session[:userinfo].present?
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
  @book = Book.find(params[:id])
  @comments = Comment.where(commentable_id: params[:id])
end

end
