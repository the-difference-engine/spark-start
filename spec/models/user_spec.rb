# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  admin      :boolean          default("false")
#

require "rails_helper"

RSpec.describe User, type: :model do

  describe '#admin?' do
   it "expect the boolean true" do 
	user = create(:user)
	expect(user.admin?).to eq(true)
   end
   it "expect the boolean false" do
   	user = create(:user,
   		           admin: false)
   	expect(user.admin?).to eq(false)
   end
  end
end
