# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  author             :string
#  body               :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Post < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true

  has_many :categorized_posts
  has_many :categories, through: :categorized_posts
  has_many :tagged_posts
  has_many :tags, through: :tagged_posts
  # belongs_to :user

  has_attached_file :image,
                    styles: { medium: "500x500>", thumb: "100x100>" },
                    :path => ENV["AWS_PATH"] + "/:id/blog/:style.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  
end
