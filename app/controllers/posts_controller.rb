class PostsController < ApplicationController
	before_filter :logged_in_using_omniauth?

  def index
    @user = session[:userinfo]
    @posts = Post.all
    @sorted_posts = Post.all.sort_by(&:created_at)

    @search_term = params[:search]

    if @search_term.blank? == false
      @searched = @posts.where("title ILIKE ? OR author ILIKE ? OR body ILIKE ?", "%#{@search_term}%", "%#{@search_term}%", "%#{@search_term}%")
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.find_by(params[:post_id])

    @category_list = @post.categories.collect { |category_name| category_name.name }
    @tag_list = @post.tags.collect { |tag| tag.tag_name }
  end

  def dashboard
    @posts = Post.all.sort
    @categories = Category.all.sort
    @tags = Tag.all.sort
  end

  def new
    # @options = Category.all.map { |category| [category.name, category.id] }
    # @tag_options = Tag.all.map { |tag| [tag.tag_name, tag.id] }
    @post = Post.new
  end

  def create
    @user = session[:userinfo]
    @post = Post.new(
      title: params[:title],
      author: params[:author],
      body: params[:body],
      user_id: @user["extra"]["raw_info"]["identities"][0]["user_id"]
    )
    if @post.save
      @category_string = params[:category_string]
      @category_string_split = @category_string.split(", ")
      @category_string_split.each do |category|
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
      @tag_string_split = @tag_string.split(", ")
      @tag_string_split.each do |tag|
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
    @post = Post.find(params[:id])
    @post_categories = @post.categories.collect { |category| category.name }
    @category_string = @post_categories.join(", ")
    @post_tags = @post.tags.collect { |tag| tag.tag_name }
    @tag_string = @post_tags.join(", ")
    # @options = Category.all.map { |category| [category.name, category.id] }
    # @tag_options = Tag.all.map { |tag| [tag.tag_name, tag.id] }
  end

  def update
    @post = Post.find(params[:id])
    @user = session[:userinfo]
    @post.update(
      title: params[:title],
      author: params[:author],
      body: params[:body]
    )

    @post.categorized_posts.each do |post|
      post.delete
    end

    @category_string = params[:category_string]
    @category_string_split = @category_string.split(", ")
    @category_string_split.each do |category|
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
    @tag_string_split = @tag_string.split(", ")
    @tag_string_split.each do |tag|
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
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/blogs/"
  end

end
