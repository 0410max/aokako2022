class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :kakomon
  belongs_to :board
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true

  private
end