require 'rails_helper'
include Auth0

RSpec.describe Admin::BooksController, type: :controller do

  describe "GET #new" do
      before(:each) do
        @user = create(:user)
      end

    it "assigns a new book to @book" do
      get :new, session: mock_auth_hash
      expect(assigns(:book)).to be_a_new(Book) 
    end

    it "renders the :new template" do 
      get :new, session: mock_auth_hash
      expect(response).to render_template :new 
    end
  end

  describe "POST #create" do
      before(:each) do
        @user = create(:user)
        @book = create(:book, 
                      user_id: @user.id)
      end

      context "with valid attributes" do
        it "saves the new book in the database" do
          expect{post :create, session: mock_auth_hash, book: attributes_for(:book) 
            }.to change(Book, :count).by (1)
          end
      end

      it "redirects to admin" do
        # binding.pry
        post :create, session: mock_auth_hash, book: attributes_for(:book)
        expect(response).to redirect_to admin_path
      end
  end

  describe "GET #edit" do
    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end

      it "assigns the requested book to @book" do
        get :edit, id: book
        expect(assigns(:book)).to eq book
      end

      it "renders the :edit template" do 
        book = create(:book)
        get :edit, id: book
        expect(response).to render_template :edit 
      end
  end

  describe "PATCH #update" do
    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end
    
    it "updates a book" do
      params = {
        title: "changed book title",
        description: "changed book description", 
        cover: nil, 
        url: nil,
        user_id: @user.id
      }
      patch :update, id: @book.id, book: params
      changed_book = Book.last
      expect(changed_book.title).to eq("changed book title")
      expect(changed_book.description).to eq("changed book description")
      expect(response).to redirect_to(admin_book_path)
      expect(flash[:success]).to eq("Book has been successfully updated.")
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end

    it "returns http success" do
      delete :destroy, id: @book.id, session: mock_auth_hash
      books = Book.all
      expect(books.length).to eq(0)
      expect(response).to redirect_to(admin_book_path)
      expect(flash[:success]).to eq("Book has been successfully deleted.")
    end
  end

  # describe "GET #index" do

  # end

  # describe "GET #show" do
  #   before(:each) do
  #     @user = create(:user)
  #     @book = create(:book, 
  #                     user_id: @user.id)
  #   end

  #   it "assigns the requested book to @book" do
  #     get :show, id: @book.id
  #     expect(assigns(:book)).to eq(@book)
  #   end

  #   it "renders the :show template" do
  #     get :show, id: @book.id
  #     expect(response).to render_template :show
  #   end
  # end

end
