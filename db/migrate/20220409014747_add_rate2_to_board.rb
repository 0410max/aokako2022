class AddRate2ToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :rate2, :integer
  end
end
