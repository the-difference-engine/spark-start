class AuthorsController < ApplicationController
  before_filter :logged_in_using_omniauth?
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :set_book
  before_action :set_current_user

  def index
    @authors = Author.all
  end

  def show
   
  end

  def new
    @author = Author.new
  end

 
  def edit
  end

 
  def create
  	@current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    params[:author][:category_ids] ||= []
    @author = Author.new(author_params)
    @author.book_id =@book.id
     if @author.save
      flash[:success]= "Author added to book!"
      redirect_to @book
    end
  end

 
  def update
  	params[:author][:category_ids] ||= []
    if @author.update(author_params)
      flash[:success]= "Updated @author.full_name!"
      redirect_to @book
    else
      render :edit 
    end
  end


  def destroy
    @author.destroy
    flash[:success]= "Author was successfully destroyed."
    redirect_to @books
  end

  private
    
    def set_book
      @book =Book.find(params[:book_id])
    end

    def set_author
      @author = Author.find(params[:id])
    end
    
    def find_author
      @authors = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:full_name, category_ids: [])
    end
end
