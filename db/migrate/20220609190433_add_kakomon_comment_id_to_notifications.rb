class AddKakomonCommentIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :kakomon_comment_id, :integer
  end
end
