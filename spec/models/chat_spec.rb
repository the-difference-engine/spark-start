require "rails_helper"

RSpec.describe Chat, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }
  end
end
