class AddRate3ToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :rate3, :integer
  end
end
