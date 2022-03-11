class AddNumberPasswordConfirmationToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :number_password_confirmation, :string
  end
end
