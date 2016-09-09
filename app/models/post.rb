class Post < ApplicationRecord

	has_many :comments
	has_many :categorized_posts
	has_many :categories, through: :categorized_posts
	has_many :tagged_posts
	has_many :tags, through: :tagged_posts

end
