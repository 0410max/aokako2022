class DropTableComment2 < ActiveRecord::Migration[6.0]
  def change
    drop_table :comment2s
  end
end
