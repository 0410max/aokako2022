class Kakomon < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many_attached :images
  validates :sub, presence:true
  validates :prof, presence:true
  validates :comment,length:{maximum: 200}

end