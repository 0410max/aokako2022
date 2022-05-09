class AddEndUserIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :end_user_id, :integer
  end
end
