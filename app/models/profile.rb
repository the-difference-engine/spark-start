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

  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

def full_name
  "#{first_name} #{last_name}"
end


end