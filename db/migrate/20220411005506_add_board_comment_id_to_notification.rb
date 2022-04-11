class AddBoardCommentIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :board_comment_id, :integer
  end
end
