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
  validates :number,presence:true,uniqueness: true,format:{with:/\A[a-zA-Z0-9]+\z/}
  validate :number_format
  validates :dep,presence:true
  validates :cor,presence:true
  validate :dep1
  validate :dep2
  validate :dep3
  validate :dep4
  validate :dep5
  validate :dep6
  validate :dep7
  validate :dep8
  validate :dep9
  validate :depA
  validate :depB
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

  def dep1
    if dep === '文学部'
      unless number.slice(1) === '1'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep2
    if dep === '経済学部'
      unless number.slice(1) === '2'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep3
    if dep === '法学部'
      unless number.slice(1) === '3'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep4
    if dep === '経営学部'
      unless number.slice(1) === '4'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep5
    if dep === '理工学部'
      unless number.slice(1) === '5'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep6
    if dep === '国際政治経済学部'
      unless number.slice(1) === '6'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep7
    if dep === '総合文化政策学部'
      unless number.slice(1) === '7'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep8
    if dep === '社会情報学部'
      unless number.slice(1) === '8'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def dep9
    if dep === '教育学部'
      unless number.slice(1) === '9'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def depA
    if dep === '地球社会共生学部'
      unless number.slice(1) === 'A' || number.slice(1) === 'a'
        errors.add(:dep, "が不正です")
      end
    end
  end

  def depB
    if dep === 'コミュニティ人間科学部'
      unless number.slice(1) === 'B' || number.slice(1) === 'b'
        errors.add(:dep, "が不正です")
      end
    end
  end


end
