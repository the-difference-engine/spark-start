require 'rails_helper'

RSpec.describe PostsController, type: :controller do
before(:each) do
    @user = create(:user)
  end

  describe "POST #create" do

    it "expect new record to be created" do
      params = {
        title: 'Test Post',
        author: 'John Doe',
        body: '1231231234',
        image_file_name: nil,
        image_content_type: nil,
        image_file_size: nil,
        image_updated_at: nil
        user_id: @user.id
      }
      post :create, params: params, session: mock_auth_hash
      posts = Post.all
      post = Post.last
      expect(post.title).to eq('Test Post')
      expect(post.author).to eq('John Doe')
      expect(post.body).to eq('1231231234')
    end
  end
end
