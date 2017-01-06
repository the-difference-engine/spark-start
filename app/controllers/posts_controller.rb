class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?
  before_action :authenticate_admin!, only: [:dashboard, :new, :create, :edit, :update, :destroy]

  def index
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @user = session[:userinfo]
    @posts = Post.all
    @sorted_posts = Post.all.sort_by(&:created_at).reverse!

    @search = params[:search]
    @tag_search = params[:tag_search]
    @category_search = params[:category_search]

    if @search.blank? == false
      @searched = @posts.where("title ILIKE ? OR author ILIKE ? OR body ILIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%")
    end

    if @tag_search.blank? == false
      @searched = Tag.find_by_tag_name(@tag_search).posts
    end

    if @category_search.blank? == false
      @searched = Category.find_by_name(@category_search).posts
    end
  end

  def show
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @post = Post.find(params[:id])

    @category_list = @post.categories.collect { |category_name| category_name.name }
    @tag_list = @post.tags.collect { |tag| tag.tag_name }
  end

  def dashboard
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @posts = Post.all.sort
    @categories = Category.all.sort
    @tags = Tag.all.sort
  end

  def new
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @post = Post.new
    @tags = Tag.all
    @categories = Category.all
  end

  def create
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @user = session[:userinfo]
    @post = Post.new(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      image: params[:image],
      user_id: @user["extra"]["raw_info"]["identities"][0]["user_id"]
    )
    if @post.save
      @category_string = params[:category_string]
      @category_string_split = @category_string.split(",")
      @category_string_split.each do |category|
        category = category.strip
        if !Category.find_by_name(category)
          @new_category = Category.create(name: category)
          CategorizedPost.create(
            post_id: @post.id,
            category_id: @new_category.id
          )
        else
          @category_id = Category.find_by_name(category)
          CategorizedPost.create(
          post_id: @post.id,
          category_id: @category_id.id
          )
        end
      end

      @tag_string = params[:tag_string]
      @tag_string_split = @tag_string.split(",")
      @tag_string_split.each do |tag|
        tag = tag.strip
        if !Tag.find_by(tag_name: tag)
          @new_tag = Tag.create(tag_name: tag)
          TaggedPost.create(
            post_id: @post.id,
            tag_id: @new_tag.id
            )
        else
          @tag_id = Tag.find_by(tag_name: tag)
          TaggedPost.create(
            post_id: @post.id,
            tag_id: @tag_id.id
            )
        end
      end

      flash[:success] = "Post created."
      redirect_to "/blog/#{@post.id}"
      
    else 
      render :new
    end
    
  end

  def edit
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @post = Post.find(params[:id])
    @post_categories = @post.categories.collect { |category| category.name }
    @category_string = @post_categories.join(", ")
    @post_tags = @post.tags.collect { |tag| tag.tag_name }
    @tag_string = @post_tags.join(", ")
  end

  def update
    @current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    @post = Post.find(params[:id])
    @user = session[:userinfo]
    if @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body]
      )

      @post.categorized_posts.each do |post|
        post.delete
      end

      @category_string = params[:category_string]
      @category_string_split = @category_string.split(",")
      @category_string_split.each do |category|
        category = category.strip
        if !Category.find_by_name(category)
          @new_category = Category.create(name: category)
          CategorizedPost.create(
            post_id: @post.id,
            category_id: @new_category.id
          )
        else
          @category_id = Category.find_by_name(category)
          CategorizedPost.create(
            category_id: @category_id.id,
            post_id: @post.id
          )
        end
      end

      @post.tagged_posts.each do |post|
        post.delete
      end

      @tag_string = params[:tag_string]
      @tag_string_split = @tag_string.split(",")
      @tag_string_split.each do |tag|
        tag = tag.strip
        if !Tag.find_by(tag_name: tag)
          @new_tag = Tag.create(tag_name: tag)
          TaggedPost.create(
            post_id: @post.id,
            tag_id: @new_tag.id
            )
        else
          @tag_id = Tag.find_by(tag_name: tag)
          TaggedPost.create(
            tag_id: @tag_id.id,
            post_id: @post.id
            )
        end
      end

      redirect_to "/blog/#{@post.id}"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/blog"
  end

  private

  def authenticate_admin!
    current_user = User.find_by_token(session[:userinfo]["extra"]["raw_info"]["identities"][0]["user_id"])
    unless current_user.admin == true
      redirect_to '/blog'
    end
  end

end
