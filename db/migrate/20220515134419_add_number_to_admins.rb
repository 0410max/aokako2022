class AddNumberToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :number, :string
  end
end
