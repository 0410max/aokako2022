class Board < ApplicationRecord
    belongs_to :user
    has_many :board_comments,dependent: :destroy
    has_many :notifications, dependent: :destroy

    validates :sub,presence: true
    validates :prof,presence: true
    validates :comment,length: { minimum: 20}

    validates :rate1, presence: true
    validates :rate2, presence: true
    validates :rate3, presence: true

    def create_notification_comment!(current_user, board_comment_id)
        temp_ids = BoardComment.select(:user_id).where(board_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
          save_notification_comment!(current_user, board_comment_id, temp_id['user_id'])
        end
        save_notification_comment!(current_user, board_comment_id, user_id) if temp_ids.blank?
      end
    
      def save_notification_comment!(current_user, board_comment_id, visited_id)
        notification = current_user.active_notifications.new(
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

end
