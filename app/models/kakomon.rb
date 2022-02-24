class Kakomon < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_one_attached :image
  validates :sub, presence:true
  validates :prof, presence:true
  validates :comment,length:{maximum: 200}

end
