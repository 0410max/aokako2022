class AddVisitedIdToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visited_id, :integer
  end
end
