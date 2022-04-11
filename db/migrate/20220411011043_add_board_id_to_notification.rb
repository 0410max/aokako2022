class AddBoardIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :board_id, :integer
  end
end
