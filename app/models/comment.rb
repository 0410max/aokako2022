class Comment < ApplicationRecord
  belongs_to :end_user
  belongs_to :kakomon
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true

  private
end