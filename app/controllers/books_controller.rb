class BooksController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create( book_params )
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def destroy
      @book = Image.find(params[:id])
      @book.file = nil
      @book.save
      @book.destroy
      flash[:warning]="Book Deleted"
      redirect_to "/books"
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def book_params
    params.require(:book).permit(:avatar)
  end
end
