class Post < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true

  has_many :categorized_posts
  has_many :categories, through: :categorized_posts
  has_many :tagged_posts
  has_many :tags, through: :tagged_posts
  # belongs_to :user

  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

  
end
