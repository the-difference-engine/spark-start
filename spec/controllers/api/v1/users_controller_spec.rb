require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do 
    @user = create(:user)
    @user.admin = true
  end

  describe "UPDATE #update" do 
  
    it "expect admin to be updated to false" do 
       params = {
        admin: false,
        id: @user.id
       }
    put :update, params: params
    user = User.last
    expect(user.admin).to eq(false)
    end
  end
end
