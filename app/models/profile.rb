# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  experience         :integer
#  bio                :text
#  phone              :string
#  career             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  first_name         :string
#  last_name          :string
#  state              :string
#  city               :string
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Profile < ApplicationRecord

  # TODO commented this all out trying to get paperclip to upload a pic
  validates :experience, presence: true
  validates :bio, presence: true
  validates :phone, presence: true
  validates :career, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :state, presence: true
  validates :state, length: {maximum: 2, message: "Must Be Valid"}
  validates :city, presence: true

  belongs_to :user

  has_attached_file :image,
                    styles: { medium: "500x500>", thumb: "100x100>" },
                    default_url: ActionController::Base.helpers.asset_path('assets/Missing_photo_:style.jpeg'),
                    :path => ENV["AWS_PATH"] + "/:id/profile/:style.:extension"
  validates_attachment_content_type :image, 
                                    :content_type => ['image/jpeg', 'image/png', 'image/gif']
  # validates_attachment :image, :size => { :in => 0..3.megabytes }
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # validates_with AttachmentSizeValidator, attributes: :image, less_than: 1.megabytes

def full_name
  "#{first_name} #{last_name}"
end

end
