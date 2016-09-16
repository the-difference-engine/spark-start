class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @user = session[:userinfo]
    @posts = Post.all.sort
  end

  def show
    @user = session[:userinfo]
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
      user_id: @user["extra"]["raw_info"]["identities"][0]["user_id"]
    )

    @category_string = params[:category_string]
    @category_string_split = @category_string.split(",")
    @category_string_split.each do |category|
      if !Category.find_by_name(category)
        Category.create(name: category)
        @category_post = CategorizedPost.create(
        post_id: @post.id,
        category_id: params[:category_id]
        )
        else
          @category_post = CategorizedPost.create(
          post_id: @post.id,
          category_id: params[:category_id]
          )
      end
    end

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
    binding.pry
    @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body]
    )

    @categorized_post = @post.categorized_posts.where("post_id = ? AND category_id = ?", @post.id, @post.category_id)
    
    @category = Category.find_or_create_by(name: params[:name])
    
    @categorized_post.update(@category)

    # @category_posts.update(name: params[:name])

    # @category_posts.each do |category|
    #   category.update(name: params[:category])
    # end

    @tag_posts = @post.tags
    @tag_posts.update(tag_name: params[:tag_name])

    # @tag_posts.each do |tag|
    #   tag.update(tag_name: params[:tag_name])
    # end

    # @tag = Tag.find_or_create_by(tag_name: params[:tag_name])

    redirect_to "/blog/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/blogs/"
  end

end
