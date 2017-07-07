require 'rails_helper'
include Auth0

RSpec.describe BooksController, type: :controller do


    describe "book_information" do
        it "returns the data of the question associated with the book" do 
            current_user = create(:user)
            book = create(:book, 
                      user_id: current_user.id)
            create(:question, 
                    book_id: book.id,
                    data: {
                        question_one: "updated question one",
                        question_two: "updated question two",
                        question_three: "updated question three"
                        })
            # binding.pry
            get :book_information, params: { id: 26 },session: mock_auth_hash
            # expect(subject).to eq(nil)


        end
    end


    # context "get all books" do
    #     describe "GET #index" do
    #         it "populates an array of all books" do
    #             user = create(:user)
    #             anna_karenina = create(:book, user_id: @user_id)
    #             crime_punishment = create(:book, user_id: @user_id)
    #             get :index
    #             expect(assigns(:books)).to match_array([anna_karenina, crime_punishment])
    #         end
    #     end

    #     it "renders the :index template" do
    #         get :index
    #         expect(response).to render_template :index
    #     end
    # end



	# before(:each) do
	# 	@user = create(:user)
	# end

# describe "POST #create" do
# 	# it "expect new record to be created" do
#     #   params = {
#     #   	#url: nil,
#     #     user_id: @user.id,
#     #     #cover_photo: nil,
#     #     #title: 'Book',
#     #     #description: 'Cool book, trust me.',
#     #     #ebook: nil
#     #   }
#     #   post :create, params: params, session: mock_auth_hash
#     #   books = Book.all
#     #   book = Book.last
#     #   expect(books.length).to eq(1)
#     #   expect(book.user_id).to eq(@user.id)
#     #   #expect(book.title).to eq('Book')
#     #   #expect(book.description).to eq('Cool book, trust me.')
#     end
end
