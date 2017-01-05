class CategoriesController < ApplicationController
  before_filter :logged_in_using_omniauth?
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user
  def index

    @categories = Category.all.sort
    
  end

  def show
  end

  def new
    @category = Category.new
  end

 
  def edit
  end

  def create
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @category = @current_user.categories.build(category_params)
     if @category.save
      flash[:success]= "Category created!"
      redirect_to @root
    end
  end

 
  def update
   @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
   if @category.update(category_params)
      flash[:success]= "Category updated!"
      redirect_to @root
    else
      render :edit 
    end
  end


  def destroy
    @category.destroy
    flash[:success]= "Category was successfully destroyed."
    redirect_to @root
  end

  private
    
    def set_current_user
       @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def book_params
      params.require(:category).permit(:name)
    end
end
