class Post < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :body, presence: true

	has_many :comments
<<<<<<< 9772f8c9e5a10055bb6295588b8191272e21e75b
	has_many :categorized_posts
	has_many :categories, through: :categorized_posts
	has_many :tagged_posts
	has_many :tags, through: :tagged_posts
  # belongs_to :user
=======
	belongs_to :category
>>>>>>> Added Model Associations and Tests

end
