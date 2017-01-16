class BooksController < ApplicationController
	before_filter :logged_in_using_omniauth?
	before_action :set_book, only: [:show, :edit, :update, :destroy, :download_pdf]
  before_action :set_current_user
def index
	if session[:userinfo].present?
		@current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
	end
    @books = Book.all
    if params[:search]
      @books= Book.where('title ILIKE ?', "%" + params[:search] + "%")
    elsif params[:category]
      @books= Book.find_by(:category => params[:category])
    end
  end

  def show
    @author = Author.where(book_id: params[:id])
  end

  def new
    @book = Book.new
  end

 
  def edit
  end

 
  def create
  	@current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    #@user = session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"]
    params[:book][:category_ids] ||= []
    #@book.author =params[:book][:authors_ids]
    @book.ebook = params[:book][:ebook]
    @book = @current_user.books.build(book_params)
     if @book.save
      flash[:success]= "Book created!"
      redirect_to @book
    end
  end

 
  def update
    params[:book][:category_ids] ||= []
    #@book.author =params[:book][:authors_ids]
    @book.ebook = params[:book][:ebook]
   if @book.update(book_params)
      flash[:success]= "Book updated!"
      redirect_to @book
    else
      render :edit 
    end
  end


  def destroy
    @book.destroy
    flash[:success]= "Book was successfully destroyed."
    redirect_to @books
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/your_file.pdf",
      filename: @book.ebook.pdf,
      type: "application/pdf"
    )
  end

  private
    
    def set_current_user
       @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :cover, :ebook, :description, user_id: :@current_user, category_ids: [])
    end
end
