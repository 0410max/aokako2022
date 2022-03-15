class RemoveCheckeFromRoom < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms,:checked,:boolean
  end
end
