class AddVisitUserIdToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :visit_user_id, :integer
  end
end
