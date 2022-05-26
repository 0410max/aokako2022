class AddBoardIdToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :board_id, :integer
  end
end
