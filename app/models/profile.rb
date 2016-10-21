class Profile < ApplicationRecord

  validates :experience, presence: true, numericality: true
  validates :bio, presence: true
  validates :phone, presence: true
  validates :career, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :state, presence: true, length: { maximum: 2 }
  validates :city, presence: true

  belongs_to :user

end
