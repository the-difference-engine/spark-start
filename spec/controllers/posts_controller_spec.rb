require 'rails_helper'
include Auth0

RSpec.describe PostsController, type: :controller do

  before(:each) do
    @post = create(:post)
    @user = create(:user)
    @user.role = "admin"
    @user.save!
  end

  describe "Post #create" do 

    # it "expect new record to be created" do 
      
    #   binding.pry
    #   post :create, session: mock_auth_hash
      
    #   expect(response).to redirect_to "/blog"
    # end

    it "expect new record to be created with a new tag and category" do 
      params = {
        title: "Hello",
        author: "Author",
        body: "this is a body",
        image: nil,
        user_id: @user.id,
        category_string: "hello",
        tag_string: "we, are marshall"
      }
      post :create, params: params, session: mock_auth_hash
      posts = Post.all
      post = Post.last
      category = Category.last
      tag = Tag.last
      taggedpost = TaggedPost.last
      expect(posts.length).to eq(2)
      expect(post.title).to eq("Hello")
      expect(post.author).to eq("Author")
      expect(post.body).to eq("this is a body")
      expect(category.name).to eq("hello")
      expect(tag.tag_name).to eq("are marshall")
      expect(taggedpost.tag_id).to eq(tag.id)
      expect(taggedpost.post_id).to eq(post.id)
    end
    it "expect new record to be created with an existing tag and category" do 
      Tag.create(tag_name: "are marshall")
      Tag.create(tag_name: "hello")
      Category.create(name: "hello")
      Category.create(name: "goodbye")
      params = {
        title: "Hello",
        author: "Author",
        body: "this is a body",
        image: nil,
        user_id: @user.id,
        category_string: "hello",
        tag_string: "we, are marshall"
      }
      post :create, params: params, session: mock_auth_hash
      posts = Post.all
      post = Post.last
      category = Category.find_by(name: "hello")
      tag = Tag.find_by(tag_name: "are marshall")
      taggedpost = TaggedPost.last
      expect(posts.length).to eq(2)
      expect(post.title).to eq("Hello")
      expect(post.author).to eq("Author")
      expect(post.body).to eq("this is a body")
      expect(category.name).to eq("hello")
      expect(tag.tag_name).to eq("are marshall")
      expect(taggedpost.tag_id).to eq(tag.id)
      expect(taggedpost.post_id).to eq(post.id)
    end
  end

  describe 'Patch #update' do 
    it "updates a post with a new tag and category" do
      params = { 
        title: "Hola",
        author: "Wie",
        body: "Body Body",
        id: @post.id,
        category_string: "hello",
        tag_string: "are marshall"
      }
      patch :update, params: params, session: mock_auth_hash
      post = Post.last
      category = Category.last
      tag = Tag.last
      taggedpost = TaggedPost.last
      expect(post.title).to eq("Hola")
      expect(category.name).to eq("hello")
      expect(tag.tag_name).to eq("are marshall")
      expect(taggedpost.tag_id).to eq(tag.id)
      expect(taggedpost.post_id).to eq(post.id)
    end
    it "updates a post with an existing tag and category" do
      Tag.create(tag_name: "are marshall")
      Tag.create(tag_name: "hello")
      Category.create(name: "hello")
      Category.create(name: "goodbye")
      params = { 
        title: "Hola",
        author: "Wie",
        body: "Body Body",
        id: @post.id,
        category_string: "hello",
        tag_string: "are marshall"
      }
      patch :update, params: params, session: mock_auth_hash
      post = Post.last
      category = Category.find_by(name: "hello")
      tag = Tag.find_by(tag_name: "are marshall")
      taggedpost = TaggedPost.last
      expect(post.title).to eq("Hola")
      expect(category.name).to eq("hello")
      expect(tag.tag_name).to eq("are marshall")
      expect(taggedpost.tag_id).to eq(tag.id)
      expect(taggedpost.post_id).to eq(post.id)
    end
  end

  describe 'Delete #destroy' do 
    before(:each) do 
      @post = create(:post, user_id: @user.id)

    end

    it "expect to delete a post" do 
      params = {id: @post.id}
      delete :destroy, params: params, session: mock_auth_hash
      posts = Post.all 
      expect(posts.length).to eq(1)
    end

  end

end
