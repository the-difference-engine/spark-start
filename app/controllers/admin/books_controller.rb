class Admin::BooksController < ApplicationController
  before_action :set_current_user 
  before_action :authenticate_admin!

  def new
    @book = Book.new
    @question = Question.new
  end

  def create
    @book = @current_user.books.new(book_params)
    if @book.save!
      questions = params[:book][:questions]
      questions.each { |question| @book.questions.create!(content: question["content"]) }
      flash[:success] = "Book created!"
      redirect_to @book
    else
      flash[:error] = "Book failed to upload"
      render :new
    end
  end

  def edit
    @book = Book.find_by_id(params[:id])
  end

  def update
    @book = Book.find_by_id(params[:id])
    @questions = @book.questions
    question_one = @book.questions[0]
    question_two = @book.questions[1]
    question_three = @book.questions[2]
    if @book.update(book_params)
      questions = params[:book][:questions]
      question_one.update(content: params[:book][:questions][0][:content])
      question_two.update(content: params[:book][:questions][1][:content])
      question_three.update(content: params[:book][:questions][2][:content])
      flash[:success]= "Book has been successfully updated."
      redirect_to admin_path
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
    params.require(:book).permit(
      :title,
      :cover,
      :url,
      :description,
      :question_1,
      :question_2,
      :question_3,
      :user_id,
      :ebook,
      :max_downloads
    )
  end

  def set_current_user
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
  end
end
