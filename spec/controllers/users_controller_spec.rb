require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    context 'with params[:letter]' do
      it "populates an array of contacts starting with the letter" do
          smith = create(:contact, lastname: 'Smith')
          jones = create(:contact, lastname: 'Jones')
          get :index, letter: 'S'
          expect(assigns(:contacts)).to
        end
    end
  end
end
