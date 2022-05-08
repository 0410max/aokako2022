class AddEndUserIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :end_user_id, :integer
  end
end
