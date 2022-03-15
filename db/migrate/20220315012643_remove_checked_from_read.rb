class RemoveCheckedFromRead < ActiveRecord::Migration[6.0]
  def change
    remove_column :reads, :checked, :boolean
  end
end
