require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    before(:each) do
      @user = create(:user)
      @book = create(:book, 
                      user_id: @user.id)
    end

    it "returns http success" do
      params = {
        title: "changed book title",
        description: "changed book description", 
        cover: nil, 
        url: nil,
        user_id: @user.id
      }
      get :update, id: @book.id, book: params
      expect(response).to have_http_status(:success)
    end

    it "updates a book" do
      params = {
        title: "changed book title",
        description: "changed book description", 
        cover: nil, 
        url: nil,
        user_id: @user.id
      }
      get :update, id: @book.id, book: params
      changed_book = Book.last
      expect(changed_book.title).to eq("changed book title")
      expect(changed_book.description).to eq("changed book description")
      expect(response).to redirect_to(admin_admins_path)
      expect(flash[:success]).to eq("Book has been successfully updated.")

    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
