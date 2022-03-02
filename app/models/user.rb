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
  validate :check_number1
  validate :check_number2
  validates :introduction,length: {maximum: 50}

  def check_number1
    if number.slice(0) != '1' || number.slice(0) != '１' || number.slice(0) != 'a'
      errors.add(:number, "学生番号が不正です。")
    end
  end

  def check_number2
    if number.slice(1) != '1' || number.slice(1) != '１' || number.slice(1) != '2' || number.slice(1) != '２' || number.slice(1) != '3' || number.slice(1) != '３' || number.slice(1) != '4' || number.slice(1) != '４' || number.slice(1) != '5' || number.slice(1) != '５' || number.slice(1) != '6' || number.slice(1) != '６' || number.slice(1) != '7' || number.slice(1) != '７' || number.slice(1) != '8' || number.slice(1) != '８' || number.slice(1) != '9' || number.slice(1) != '９' || number.slice(1) != 'A' || number.slice(1) != 'a' || number.slice(1) != 'B' || number.slice(1) != 'b'
      errors.add(:number, "学生番号が不正です。")
    end
  end

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

  def dep_cor(user) 
    if user.number == '5' 
      dep = '理工学部' 
    end
  end
end
