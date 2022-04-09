class CreateComment2s < ActiveRecord::Migration[6.0]
  def change
    create_table :comment2s do |t|
      t.integer :user_id
      t.integer :board_id
      t.text :comment

      t.timestamps
    end
  end
end
