class Room < ApplicationRecord
    has_many :room_users
    has_many :end_users, through: :room_users
    has_many :messages
    has_many :notifications, dependent: :destroy
    has_many :reads,dependent: :destroy
    def get_profile_image
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/no-image.png')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      profile_image
    end

end


