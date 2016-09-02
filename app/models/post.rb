class Post < ApplicationRecord

	has_many :comments
	has_many :categorized_posts
	has_many :categories, through: :categorized_posts

end
