class BooksController < ApplicationController 
	before_filter :logged_in_using_omniauth?
  before_action :set_current_user
  before_action :has_profile?
  before_action :set_book, only: [:show, :edit, :update, :destroy, :download_pdf]
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
    # if session[:userinfo].present?
    #   @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    # end
    @book = Book.find(params[:id])
    @book_information = book_payload
    # TODO introduce serializing to bring all this over at once
    # @questions = ["What did this book do?", "What did this book?", "Are you there God? It's me Margaret."]
    # @book_image = "travelas.png"
    # @book_download = "Click to Download" #this is not getting used?
  end

  def new
    @book = Book.new
  end

  def edit
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

 
  def update
    params[:book][:category_ids] ||= []
    @bookebook = params[:book][:ebook]
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

  def book_payload
    {
      questions: ["Book question number one", "Book question number two", "Book question number three"],
      image: 'travelas.png'
    }
  end

    def set_current_user
       @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    end

    def has_profile?
       if @current_user.profile.nil?
           flash[:warning] = "Please create a new profile first!"
           redirect_to new_profile_path
       end
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :cover, :url, :@bookebook, :description, user_id: :@current_user, category_ids: [])
    end
end
