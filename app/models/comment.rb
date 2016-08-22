class Comment < ApplicationRecord

<<<<<<< 9772f8c9e5a10055bb6295588b8191272e21e75b
  validates :body, presence: true

=======
>>>>>>> Added Model Associations and Tests
  belongs_to :post

end
