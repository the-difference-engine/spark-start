class CategoriesController < ApplicationController

  def index

    @categories = Category.all.sort
    
  end

  def create
  
  end

end
