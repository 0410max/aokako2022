class AddStatusToKakomonreports < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomonreports,:status,:boolean,default:false
  end
end
