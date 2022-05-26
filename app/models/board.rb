class Board < ApplicationRecord
    belongs_to :end_user
    has_many :board_comments,dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :boardfavorites, dependent: :destroy

    def favorited_by?(end_user)
      boardfavorites.exists?(end_user_id: end_user.id)
    end

    validates :sub,presence: true
    validates :prof,presence: true
    validates :comment,presence: true

    validates :rate1, presence: true
    validates :rate2, presence: true
    validates :rate3, presence: true

    def create_notification_comment!(current_end_user, board_comment_id)
      temp_ids = BoardComment.select(:end_user_id).where(board_id: id).where.not(end_user_id: current_end_user.id).distinct
      temp_ids.each do |temp_id|
        save_notification_comment!(current_end_user, board_comment_id, temp_id['end_user_id'])
      end
      save_notification_comment!(current_end_user, board_comment_id, end_user_id) if temp_ids.blank?
    end
  
    def save_notification_comment!(current_end_user, board_comment_id, visited_id)
      notification = current_end_user.active_notifications.new(
        board_id: id,
        board_comment_id: board_comment_id,
        visited_id: visited_id,
        action: 'board_comment'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end

      def create_notification_thanks!(current_end_user)
        temp = Notification.where(["visitor_id = ? and visited_id = ? and board_id = ? and action = ? ", current_end_user.id, end_user_id, id, 'thanks'])
        if temp.blank?
          notification = current_end_user.active_notifications.new(
            board_id: id,
            visited_id: end_user_id,
            action: 'thanks'
          )
          if notification.visitor_id == notification.visited_id
            notification.checked = true
          end
          notification.save if notification.valid?
        end
      end

end
