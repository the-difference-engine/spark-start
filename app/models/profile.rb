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

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
