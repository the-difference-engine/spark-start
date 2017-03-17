# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require "rails_helper"

RSpec.describe Chat, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }
  end
end
