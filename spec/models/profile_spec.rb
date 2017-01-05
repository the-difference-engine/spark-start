require "rails_helper"
include Auth0

RSpec.describe Profile, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:experience).of_type(:integer) }
    it { should have_db_column(:bio).of_type(:text) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:career).of_type(:string) }
    it { should have_db_column(:image_file_name).of_type(:string) }
    it { should have_db_column(:image_content_type).of_type(:string) }
    it { should have_db_column(:image_file_size).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe '#full_name' do
    it 'it returns a users full name' do
       @user = create(:user)
       create(:profile, user_id: @user.id)
       expect(@user.profile.full_name).to eq('John Doe')
    end
  end

end