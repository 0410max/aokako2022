class AddAdminRoomUserIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :admin_room_user_id, :integer
  end
end
