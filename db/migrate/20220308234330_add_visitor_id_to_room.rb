class AddVisitorIdToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visitor_id, :integer
  end
end
