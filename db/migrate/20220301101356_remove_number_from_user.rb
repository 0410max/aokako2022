class RemoveNumberFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :number, :integer
  end
end
