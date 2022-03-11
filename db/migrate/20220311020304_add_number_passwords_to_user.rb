class AddNumberPasswordsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number_password, :string
  end
end
