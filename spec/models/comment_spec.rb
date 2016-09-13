require "rails_helper"

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:post) }
  end

  describe 'Database data types' do
    it { should have_db_column(:post_id).of_type(:integer) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:approved).of_type(:boolean) }
  end
end
