# == Schema Information
#
# Table name: books
#
#  id                 :integer          not null, primary key
#  url                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  cover_file_name    :string
#  cover_content_type :string
#  cover_file_size    :integer
#  cover_updated_at   :datetime
#  title              :string
#  description        :text
#  ebook_file_name    :string
#  ebook_content_type :string
#  ebook_file_size    :integer
#  ebook_updated_at   :datetime
#

require "rails_helper"

RSpec.describe Book, type: :model do

  describe 'Database data types' do
    it { should have_db_column(:url).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end
end
