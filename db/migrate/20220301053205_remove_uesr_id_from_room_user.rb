class RemoveUesrIdFromRoomUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :room_users, :uesr_id, :integer
  end
end
