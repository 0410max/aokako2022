class AddCheckedToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :checked, :boolean
  end
end
