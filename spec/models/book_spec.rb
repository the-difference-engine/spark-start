require "rails_helper"

RSpec.describe Book, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end
end
