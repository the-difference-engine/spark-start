class Admin::PostsController < ApplicationController

def new
end

def create
end

def edit
	@post = Post.find(params[:id])
    @post_categories = @post.categories.collect { |category| category.name }
    @category_string = @post_categories.join(", ")
    @post_tags = @post.tags.collect { |tag| tag.tag_name }
    @tag_string = @post_tags.join(", ")
end

def update
end

def destroy
end

private



end
