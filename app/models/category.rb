class Category < ApplicationRecord

<<<<<<< 9772f8c9e5a10055bb6295588b8191272e21e75b
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :categorized_posts
  has_many :posts, through: :categorized_posts

=======
  has_many :posts
  
>>>>>>> Added Model Associations and Tests
end
