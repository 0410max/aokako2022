class AddRate1ToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :rate1, :integer
  end
end
