class CreateBoardfavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :boardfavorites do |t|
      t.integer :end_user_id
      t.integer :board_id

      t.timestamps
    end
  end
end
