class CreateBoardComments < ActiveRecord::Migration[6.0]
  def change
    create_table :board_comments do |t|
      t.integer :user_id
      t.integer :board_id
      t.text :comment

      t.timestamps
    end
  end
end
