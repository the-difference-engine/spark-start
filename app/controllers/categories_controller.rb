class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]

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
    @category = Category.new(category_params)

    if @category.save
      format.html { redirect_to @category, notice: 'Cast was successfully created.' }
    else
      format.html { render :new }
    end
  end

  def update
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
  end


  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    end
  end

  private
    
    def set_category
      @category =Category.find(params[:category_id])
    end
end
