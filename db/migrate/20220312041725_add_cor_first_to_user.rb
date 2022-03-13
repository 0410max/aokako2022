class AddCorFirstToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cor_first, :string
  end
end
