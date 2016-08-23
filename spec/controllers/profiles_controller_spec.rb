require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  describe 'this is a fake test' do
    it 'expect test to fail' do
      expect(true).to eq(false)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested profile to @profile' do
      profile = create(:profile)
      get :show, id: profile
      expect(assigns(:profile)).to eq profile
    end

    it 'renders the :show template' do
      profile = create(:profile)
      get :show, id: profile
      expect(response).to render_template :show
    end
  end

end
