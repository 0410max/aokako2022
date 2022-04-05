class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :kakomon
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true

  private
end