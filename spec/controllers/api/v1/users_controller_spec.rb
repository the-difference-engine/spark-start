require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do 
    @user = create(:user)
  end
end
