# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  experience         :integer
#  bio                :text
#  phone              :string
#  career             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  first_name         :string
#  last_name          :string
#  state              :string
#  city               :string
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require "rails_helper"
include Auth0

RSpec.describe Profile, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:experience).of_type(:string) }
    it { should have_db_column(:bio).of_type(:text) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:career).of_type(:string) }
    it { should have_db_column(:image_file_name).of_type(:string) }
    it { should have_db_column(:image_content_type).of_type(:string) }
    it { should have_db_column(:image_file_size).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe 'validations' do 
    it { should validate_presence_of(:experience) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:career) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
      
    it { should validate_presence_of(:state) }
    it { should validate_length_of(:state).is_at_most(2).with_message("Must Be Valid") }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:linkedin_url) }
  end

  describe '#full_name' do
    it 'it returns a users full name' do
       @user = create(:user)
       create(:profile, user_id: @user.id)
       expect(@user.profile.full_name).to eq('John Doe')
    end
  end



end
