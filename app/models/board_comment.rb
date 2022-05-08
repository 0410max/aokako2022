class BoardComment < ApplicationRecord
    belongs_to :end_user
    belongs_to :board
    has_many :notifications, dependent: :destroy

    validates :comment, presence: true
end
