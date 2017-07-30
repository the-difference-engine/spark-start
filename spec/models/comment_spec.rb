# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  approved         :boolean          default("false")
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :integer
#

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
