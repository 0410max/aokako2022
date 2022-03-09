class RemoveActionFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :action, :string
  end
end
