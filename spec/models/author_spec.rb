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

require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
