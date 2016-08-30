require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  describe 'this is a fake test' do
    xit 'expect test to fail' do
      expect(true).to eq(false)
    end
  end  

  # describe 'GET #show' do
  #   it 'assigns the requested profile to @profile' do
  #     profile = create(:profile)
  #     get :show, id: profile.id

  #     expect(assigns(:profile)).to eq profile
  #     expect(profile.first_name).to eq('John')
  #   end

  #   it 'renders the :show template' do
  #     profile = create(:profile)
  #     get :show, id: profile

  #     expect(response).to assert_response :success
  #   end
  # end

  # describe 'POST #create' do
  #   it 'creates a new profile' do
  #     post :create, params: { first_name: 'troy', last_name: 'leach', phone: '3039477348', career: 'education', city: 'denver', state: 'co', experience: 12 }
  #     profile = Profile.last

  #     expect(profile.first_name).to eq('troy')
  #     expect(profile.last_name).to eq('leach')
  #     expect(profile.phone).to eq('3039477348')
  #     expect(profile.career).to eq('education')
  #     expect(profile.city).to eq('denver')
  #     expect(profile.state).to eq('co')
  #     expect(profile.experience).to eq(12)
  #   end
  # end

  describe 'PATCH #update' do
    # it 'edits an existing profile' do
    #   patch :update, id: profile, params: { first_name: 'lala', last_name: 'lalala', phone: '000-000-0000', career: 'meh', city: 'here', state: 'there', experience: 100 }
    #   profile = Profile.last

    #   expect(profile.first_name).to eq('lala')
    #   expect(profile.last_name).to eq('lalala')
    #   expect(profile.phone).to eq('000-000-0000')
    #   expect(profile.career).to eq('meh')
    #   expect(profile.city).to eq('here')
    #   expect(profile.state).to eq('there')
    #   expect(profile.experience).to eq(100)
    # end

    let(:profile) {Profile.create(first_name: "My name", experience: 23)}

    it "updates a profile" do
      patch :update, id: profile, profile: {first_name: "Updated name", experience: 23}
      profile.reload
      expect(profile.first_name).to eq("Updated name")
   end

  end
end