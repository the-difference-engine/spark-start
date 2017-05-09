# == Schema Information
#
# Table name: tagged_posts
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaggedPost < ApplicationRecord

  belongs_to :post
  belongs_to :tag

end
