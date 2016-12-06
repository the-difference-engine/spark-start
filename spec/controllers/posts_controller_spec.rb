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

    it "expect new record to be created" do 
      params = {
        title: "Hello",
        author: "Author",
        body: "this is a body",
        image: nil,
        user_id: @user.id,
        category_string: "hello",
        tag_string: "hello"
      }
      post :create, params: params, session: mock_auth_hash
      posts = Post.all
      post = Post.last
      expect(posts.length).to eq(2)
      expect(post.title).to eq("Hello")
      expect(post.author).to eq("Author")
      expect(post.body).to eq("this is a body")
    end
  end

  describe 'Patch #update' do 
    it "updates a post" do
      params = { 
        title: "Hola",
        author: "Wie",
        body: "Body Body",
        id: @post.id,
        category_string: "hello",
        tag_string: "hello"
      }
      patch :update, params: params, session: mock_auth_hash
      post = Post.last
      expect(post.title).to eq("Hola")
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
