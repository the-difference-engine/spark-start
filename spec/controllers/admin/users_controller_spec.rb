require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

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
    end

    it "updates a user" do
      params = {
        email: "changed email",
        admin: false
      }
      get :update, id: @user.id, user: params
      changed_user = User.last
      expect(changed_user.email).to eq("changed email")
      expect(changed_user.admin).to eq(false)
      expect(response).to redirect_to(admin_user_path)
      expect(flash[:success]).to eq("User has been successfully updated.")
    end
  end

  describe "GET #destroy" do
    before(:each) do
      @user = create(:user)
    end

    it "returns http success" do
      get :destroy, id: @user.id
      users = User.all
      expect(users.length).to eq(0)
      expect(response).to redirect_to(admin_user_path)
      expect(flash[:success]).to eq("User has been successfully deleted.")
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
