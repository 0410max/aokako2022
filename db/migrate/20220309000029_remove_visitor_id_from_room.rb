class RemoveVisitorIdFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :visitor_id, :integer
  end
end
