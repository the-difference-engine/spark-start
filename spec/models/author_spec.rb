# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#

require "rails_helper"

RSpec.describe Book, type: :model do

  describe 'Return an array of author names' do
  	book = create(:book)
  	author = create(:author, book_Id: book.id)

  	expect()
    
  end
end
