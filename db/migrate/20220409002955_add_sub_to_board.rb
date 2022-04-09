class AddSubToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :sub, :string
  end
end
