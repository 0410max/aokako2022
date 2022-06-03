class Kakomon < ApplicationRecord
  belongs_to :end_user
  has_many :comments,dependent: :destroy
  has_many :kakomoncomments,dependent: :destroy
  has_many :reports,dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :kakomonfavorites,dependent: :destroy
  has_one_attached :image1
  has_one_attached :image2
  has_one_attached :image3
  validates :image1,presence:true
  validates :year,presence:true
  validates :sub, presence:true
  validates :prof, presence:true
  validates :comment,presence:true

  def favorited_by?(end_user)
    kakomonfavorites.exists?(end_user_id: end_user.id)
  end

  def create_notification_comment!(current_end_user, comment_id)
    temp_ids = Comment.select(:end_user_id).where(kakomon_id: id).where.not(end_user_id: current_end_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_end_user, comment_id, temp_id['end_user_id'])
    end
    save_notification_comment!(current_end_user, comment_id, end_user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_end_user, comment_id, visited_id)
    notification = current_end_user.active_notifications.new(
      kakomon_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  def create_notification_thanks!(current_end_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and kakomon_id = ? and action = ? ", current_end_user.id, end_user_id, id, 'kakomonthanks'])
    if temp.blank?
      notification = current_end_user.active_notifications.new(
        kakomon_id: id,
        visited_id: end_user_id,
        action: 'kakomonthanks'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

end
