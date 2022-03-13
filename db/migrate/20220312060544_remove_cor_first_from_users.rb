class RemoveCorFirstFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :cor_first, :string
  end
end
