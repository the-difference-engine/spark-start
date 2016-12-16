require 'rails_helper'
include Auth0

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
  end
  describe "POST #create" do

    it "expect new record to be created" do
     
      comment_params = {
      	comment: {
          body: 'this is a great book',
          post_id: @post.id
        }
        #user_id: @user.id
        #approved: 'false'
      }
      post :create, params: comment_params, session: mock_auth_hash
      comments = Comment.all
      comment = Comment.last
      expect(comment.body).to eq('this is a great book')
      #expect(comment.approved).to eq('false')
    end
  end
end