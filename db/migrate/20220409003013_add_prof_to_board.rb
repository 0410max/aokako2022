class AddProfToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :prof, :string
  end
end
