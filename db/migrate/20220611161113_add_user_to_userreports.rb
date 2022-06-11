class AddUserToUserreports < ActiveRecord::Migration[6.0]
  def change
    add_column :userreports,:user,:string
    add_column :userreports,:end_user,:string
    add_column :userreports,:status,:boolean,default:false
  end
end
