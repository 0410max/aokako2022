class AddColumnToEndUser < ActiveRecord::Migration[6.0]
  def change
    add_column :end_users,:name,:string
    add_column :end_users,:introduction,:text
    add_column :end_users,:number,:string
    add_column :end_users,:dep,:string
    add_column :end_users,:cor,:string
    add_column :end_users,:year,:string
  end
end
