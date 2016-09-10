class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @user = session[:userinfo]
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.find_by(params[:post_id])
  end

  def new
    @options = Category.all.map { |category| [category.name, category.id]}
    @tag_options = Tag.all.map { |tag| [tag.tag_name, tag.id]}
  end

  def create
    @user = session[:userinfo]
    @post = Post.create(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      user_id: params[:user_id]
    )
    @cat_posts = CategorizedPost.create(
      post_id: @post.id,
      category_id: params[:category_id]
    )
    binding.pry

    @category = Category.find_or_create_by(
      name: params[:name]
    )

    @tag_posts = TaggedPost.create(
      post_id: @post.id,
      tag_id: params[:tag_id]
    )

    @tag = Tag.find_or_create_by(
      tag_name: params[:tag_name]
    )

    redirect_to "/blog/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
    @options = Category.all.map { |category| [category.name, category.id]}
    @tag_options = Tag.all.map { |tag| [tag.tag_name, tag.id]}
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      tags: params[:tags],
      user_id: @user[:user_id]
    )
    redirect_to "/blog/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/blog/"
  end

end
