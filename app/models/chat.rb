# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Chat < ApplicationRecord

  belongs_to :user
  
end
