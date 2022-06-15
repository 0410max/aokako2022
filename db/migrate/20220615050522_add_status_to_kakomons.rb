class AddStatusToKakomons < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons,:status,:boolean,default: false
    add_column :boards,:status,:boolean,default: false
  end
end
