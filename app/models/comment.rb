class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :kakomon

  validates :comment, presence: true
end