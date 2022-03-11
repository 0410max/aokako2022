class AddNumberPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number_password, :integer
  end
end
