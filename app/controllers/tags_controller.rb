class TagsController < ApplicationController

  def index

    @tags = Tag.all.sort
    
  end

end
