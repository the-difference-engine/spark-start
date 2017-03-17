# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_name   :string
#

class Tag < ApplicationRecord

  validates :tag_name, uniqueness: true

  has_many :tagged_posts
  has_many :posts, through: :tagged_posts

end
