require "rails_helper"

RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should have_many(:categories) }
    it { should have_many(:comments) }
  end

  describe 'Database data types' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:author).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end
end
