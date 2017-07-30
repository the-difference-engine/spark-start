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

class Comment < ApplicationRecord
  validates :body, presence: true

  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: true
  belongs_to :user, optional: true
end
