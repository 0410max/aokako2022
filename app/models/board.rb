class Board < ApplicationRecord
    belongs_to :user
    has_many :board_comments,dependent: :destroy
    has_many :notifications, dependent: :destroy

    validates :sub,presence: true
    validates :prof,presence: true
    validates :comment,length: { minimum: 20}
    validates :rate1, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    validates :rate2, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    validates :rate3, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

    def create_notification_comment!(current_user, board_comment_id)
        # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
        temp_ids = BoardComment.select(:user_id).where(board_id: id).where.not(user_id: current_user.id).distinct
        temp_ids.each do |temp_id|
          save_notification_comment!(current_user, board_comment_id, temp_id['user_id'])
        end
        # まだ誰もコメントしていない場合は、投稿者に通知を送る
        save_notification_comment!(current_user, board_comment_id, user_id) if temp_ids.blank?
      end
    
      def save_notification_comment!(current_user, board_comment_id, visited_id)
        # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
        notification = current_user.active_notifications.new(
          board_id: id,
          board_comment_id: board_comment_id,
          visited_id: visited_id,
          action: 'board_comment'
        )
        # 自分の投稿に対するコメントの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
      end

end
