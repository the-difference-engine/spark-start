# == Schema Information
#
# Table name: categorized_posts
#
#  id          :integer          not null, primary key
#  post_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategorizedPost < ApplicationRecord
  belongs_to :post
  belongs_to :category
end
