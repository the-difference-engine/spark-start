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

	belongs_to :category

end
