class AddBoardIdToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :board_id, :integer
  end
end
