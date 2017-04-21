class Admin::BooksController < ApplicationController
  before_action :set_current_user 
  def new
    
    @book = Book.new
  end

  def create
     params[:book][:category_ids] ||= []
    @bookebook = params[:book][:ebook]
    @book = @current_user.books.build(book_params)
     if @book.save
      flash[:success]= "Book created!"
      redirect_to @book
    end
  end

  def edit
    @book = Book.find_by_id(params[:id])
  end

  def update
    @book = Book.find_by_id(params[:id])
    if @book.update(book_params)
      flash[:success]= "Book has been successfully updated."
      redirect_to admin_book_path
    else
      render :edit 
    end
  end

  def destroy
    @book = Book.find_by_id(params[:id])
    if @book.destroy
      flash[:success]= "Book has been successfully deleted."
      redirect_to admin_path
    else
      render :index
    end
  end

  # def index
  #   # @books = Book.all
  # end

  # def show
  #   @book = Book.find_by_id(params[:id])
  # end

private
  def book_params
    params.require(:book).permit(:title, :cover, :url, :description, :user_id)
  end

  def set_current_user
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end
