class AddEndUserIdToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :end_user_id, :integer
  end
end
