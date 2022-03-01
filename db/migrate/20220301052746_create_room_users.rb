class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.integer :room_id
      t.integer :uesr_id

      t.timestamps
    end
  end
end
