require 'rails_helper'
include Auth0

RSpec.describe BooksController, type: :controller do

	before(:each) do
		@user = create(:user)
	end

describe "POST #create" do
	

	
    # it "expect new record to be created" do
    #   params = {
    #   	#url: nil,
    #     user_id: @user.id,
    #     #cover_photo: nil,
    #     #title: 'Book',
    #     #description: 'Cool book, trust me.',
    #     #ebook: nil
    #   }
    #   post :create, params: params, session: mock_auth_hash
    #   books = Book.all
    #   book = Book.last
    #   expect(books.length).to eq(1)
    #   expect(book.user_id).to eq(@user.id)
    #   #expect(book.title).to eq('Book')
    #   #expect(book.description).to eq('Cool book, trust me.')
    end

end
end
