class RemoveNumberPasswordFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :number_password, :integer
  end
end
