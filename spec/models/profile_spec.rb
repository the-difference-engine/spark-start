require "rails_helper"

RSpec.describe Profile, type: :model do

describe 'Database data types' do
  it { should have_db_column(:experience).of_type(:integer) }
  it { should have_db_column(:bio).of_type(:text) }
  it { should have_db_column(:phone).of_type(:string) }
  it { should have_db_column(:career).of_type(:string) }
  it { should have_db_column(:image).of_type(:string) }
  it { should have_db_column(:user_id).of_type(:integer) }
end
end
