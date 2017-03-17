# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  author             :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

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
