class Profile < ApplicationRecord

<<<<<<< 9772f8c9e5a10055bb6295588b8191272e21e75b
  validates :experience, presence: true, numericality: true
  validates :bio, presence: true
  validates :phone, presence: true
  validates :career, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :state, presence: true, length: { maximum: 2 }
  validates :city, presence: true

=======
>>>>>>> Added Model Associations and Tests
  belongs_to :user

end
