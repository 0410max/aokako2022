class AddIsDisplayToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards,:is_display,:boolean,default:true
  end
end
