class AddCorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cor, :string
  end
end
