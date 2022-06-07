class AddMessagetimeToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :messagetime, :integer
  end
end
