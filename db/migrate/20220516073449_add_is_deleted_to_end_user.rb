class AddIsDeletedToEndUser < ActiveRecord::Migration[6.0]
  def change
    add_column :end_users,:is_deleted,:boolean,default:false
  end
end
