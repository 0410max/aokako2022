class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kakomons,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_one_attached :profile_image

  validates :name,presence:true,length: {minimum:2,maximum: 20}, uniqueness: { case_sensitive: false }
  validates :introduction,length: {maximum: 100}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end
end
