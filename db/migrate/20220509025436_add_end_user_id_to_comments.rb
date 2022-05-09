class AddEndUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :end_user_id, :integer
  end
end
