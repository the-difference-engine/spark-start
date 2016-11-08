class BooksController < ApplicationController
	before_filter :logged_in_using_omniauth?

def index
	if session[:userinfo].present?
		@current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
	end
end

def new
  @book.new
end

def create
  @book = Book.create( book_params )
end

def show
end

private
def book_params
  params.require(:book).permit(:book)
end


end
