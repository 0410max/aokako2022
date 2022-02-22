class Kakomon < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  validates :prof, presence: true
  validates :comment,length:{maximum: 200}

end
