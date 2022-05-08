class Message < ApplicationRecord
    belongs_to :room
    belongs_to :end_user
    has_many :notifications, dependent: :destroy


    validates :message ,presence:true
end

