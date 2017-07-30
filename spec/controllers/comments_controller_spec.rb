require 'rails_helper'
include Auth0

RSpec.describe CommentsController, type: :controller do
  before(:each) do
    @user = create(:user)
    @request.env['HTTP_REFERER'] = 'http://localhost:3000/books/1'
    @book = Book.new(user_id: @user.id)
    @book.save
  end

  describe "POST #create" do
    it "expect a new comment to be created" do
      params = {
        body: "hello",
        commentable_id: @book.id,
        commentable_type: "Book",
        user_id: @user.id
      }
      post :create, params: params, session: mock_auth_hash
      comment = Comment.last
      comments = Comment.all
      expect(comments.length).to eq(1)
      expect(comment.body).to eq("hello")
      expect(comment.commentable_type).to eq("Book")
    end
  end
end
