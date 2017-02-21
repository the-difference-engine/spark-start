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
  @questions = ["What did this book do?", "What did this book?", "Are you there God? It's me Margaret."]
  @book_image = "travelas.png"
  @book_download = "Click to Download"
end

end
