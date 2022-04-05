class AddKakomonIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :kakomon_id, :integer
  end
end
