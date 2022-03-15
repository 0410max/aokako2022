class AddCheckedToReads < ActiveRecord::Migration[6.0]
  def change
    add_column :reads,:checked,:boolean,default:false,null:false
  end
end
