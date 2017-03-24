class Admin::BooksController < ApplicationController
  def new
  end

  def create
  end

  def edit
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
  end

  def index
  end

  def show
  end

private
  def book_params
      params.require(:book).permit(:title, :cover, :url, :description, :user_id)
    end
end
