require "rails_helper"

RSpec.describe Category, type: :model do
  describe 'Associations' do
    it { should have_many(:posts) }
  end

  describe 'Database data types' do
    it { should have_db_column(:name).of_type(:string) }
  end
end
