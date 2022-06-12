class CreateBoardreports < ActiveRecord::Migration[6.0]
  def change
    create_table :boardreports do |t|
      t.integer :report,null:false
      t.integer :board_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end
