class AddUserIdToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :user_id, :integer
  end
end
