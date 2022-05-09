class AddEndUserIdToRoomUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :room_users, :end_user_id, :integer
  end
end
