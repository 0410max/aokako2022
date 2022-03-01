class AddUserIdToRoomUser < ActiveRecord::Migration[6.0]
  def change
    add_column :room_users, :user_id, :integer
  end
end
