class AddCheckedToRead < ActiveRecord::Migration[6.0]
  def change
    add_column :reads, :checked, :boolean
  end
end
