class AddEndUserIdToKakomons < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :end_user_id, :integer
  end
end
