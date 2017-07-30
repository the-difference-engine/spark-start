# == Schema Information
#
# Table name: authors_books
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe AuthorsBook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
