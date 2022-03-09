class RemoveVisitedIdFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :visited_id, :integer
  end
end
