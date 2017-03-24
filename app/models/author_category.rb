# == Schema Information
#
# Table name: author_categories
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AuthorCategory < ApplicationRecord
  belongs_to :author
  belongs_to :category
end
