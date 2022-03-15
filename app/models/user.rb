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
  has_many :reports,dependent: :destroy
  has_many :reads
  has_one_attached :profile_image

  validates :name,presence:true,length: {maximum: 10},uniqueness: true,format:{with:/\A[a-zA-Z0-9]+\z/}
  validates :number,presence:true,uniqueness: true
  validate :number_format
  validates :introduction,length: {maximum: 100}

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

  def email_required?
    false
  end

  def password_required?
    false
  end

  def number_format
    if number.slice(0) != 'a' ||number.length != 8 || number.slice(5) == '5' || number.slice(5) == '6' || number.slice(5) == '7' || number.slice(5) == '8' || number.slice(5) == '9'
      errors.add(:number, "が不正です")
    end
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end


end
