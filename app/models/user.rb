class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kakomons,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :relationships,foreign_key: :following_id
  has_many :followings,through: :relationships,source: :follower
  has_many :reverse_of_relationshiops,class_name:'Relationship',foreign_key: :follower_id
  has_many :followers,through: :reverse_of_relationshiops,source: :following
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_one_attached :profile_image

  validates :name,presence:true,length: {maximum: 10},uniqueness: true
  validates :number,presence:true,length: {is:8},uniqueness: true
  validates :introduction,length: {maximum: 50}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def followed_by?(user)
    reverse_of_relationshiops.find_by(following_id: user.id).present?
  end

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image
  end

end
