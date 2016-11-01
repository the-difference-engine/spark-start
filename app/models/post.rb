class Post < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true

	has_many :comments
	has_many :categorized_posts
	has_many :categories, through: :categorized_posts
	has_many :tagged_posts
	has_many :tags, through: :tagged_posts
  # belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
