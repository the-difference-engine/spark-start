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
      user_id: @user["uid"]
    )

    @category_post = CategorizedPost.create(
      post_id: @post.id,
      category_id: params[:category_id]
    )

    @category = Category.find_or_create_by(name: params[:name])

    @tag_post = TaggedPost.create(
      post_id: @post.id,
      tag_id: params[:tag_id]
    )

    @tag = Tag.find_or_create_by(tag_name: params[:tag_name])

    redirect_to "/blog/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
    @options = Category.all.map { |category| [category.name, category.id]}
    @tag_options = Tag.all.map { |tag| [tag.tag_name, tag.id]}
  end

  def update
  
    @post = Post.find(params[:id])
    @user = session[:userinfo]
    @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      user_id: @user["uid"]
    )

    @category_posts = @post.categories

    # @category_posts.each do |category|
    #   category.update(name: params[:category])
    # end

    @category = Category.find_or_create_by(name: params[:name])

    @tag_posts = @post.tags

    # @tag_posts.each do |tag|
    #   tag.update(tag_name: params[:tag_name])
    # end

    @tag = Tag.find_or_create_by(tag_name: params[:tag_name])

    redirect_to "/blog/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/blog/"
  end

end
