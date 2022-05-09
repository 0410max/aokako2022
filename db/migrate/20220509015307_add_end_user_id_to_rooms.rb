class AddEndUserIdToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :end_user_id, :integer
  end
end
