class CategoriesController < ApplicationController

  def index

    @categories = Category.all
    
  end

  def create
  
  end

end
