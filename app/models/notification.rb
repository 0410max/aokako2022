class Notification < ApplicationRecord
    default_scope -> { order(created_at: :desc) }

    belongs_to :kakomon, optional: true
    belongs_to :comment, optional: true
    belongs_to :board, optional: true
    belongs_to :boald_comment, optional: true

    belongs_to :visitor, class_name: 'EndUser', foreign_key: 'visitor_id', optional: true
    belongs_to :visited, class_name: 'EndUser', foreign_key: 'visited_id', optional: true

    def favorited_by?(user)
        favorites.where(end_user_id: user.id).exists?
    end 
end