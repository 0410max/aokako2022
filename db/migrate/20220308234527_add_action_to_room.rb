class AddActionToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :action, :string
  end
end
