require 'rails_helper'
include Auth0

RSpec.describe ProfilesController, type: :controller do

  before(:each) do
    @user = create(:user)
  end

  describe "POST #create" do

    it "expect new record to be created" do
      params = {
        experience: 10,
        bio: 'this is the bio',
        phone: '1231231234',
        career: 'mentor',
        image: nil,
        user_id: @user.id,
        first_name: 'john',
        last_name: 'doe',
        city: 'chicago',
        state: 'il'
      }
      post :create, params: params, session: mock_auth_hash
      profiles = Profile.all
      profile = Profile.last
      expect(profiles.length).to eq(1)
      expect(profile.experience).to eq(10)
      expect(profile.career).to eq('mentor')
    end

  end

  describe 'PATCH #update' do

    it "updates a profile" do
      @profile = create(:profile,
                        user_id: @user.id)
      params = {
        experience: 10,
        bio: 'this is the bio',
        phone: '1231231234',
        career: 'mentor',
        image: nil,
        user_id: @user.id,
        first_name: 'bobby',
        last_name: 'hill',
        city: 'chicago',
        state: 'il',
        id: @profile.id
      }

      patch :update, params: params, session: mock_auth_hash
      profile = Profile.last
      expect(profile.first_name).to eq("bobby")
      expect(profile.last_name).to eq("hill")
   end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @profile = create(:profile,
                        user_id: @user.id)
      @profile = create(:profile,
                        user_id: @user.id)
    end

    it "expect to delete a profile" do
      params = {id: @profile.id}
      delete :destroy, params: params, session: mock_auth_hash
      profiles = Profile.all
      expect(profiles.length).to eq(1)
    end
  end

end
