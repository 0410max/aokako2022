class AddCorFirstToDepartment < ActiveRecord::Migration[6.0]
  def change
    add_column :departments, :cor_first, :string
  end
end
