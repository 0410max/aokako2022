class AddEndUserIdToActives < ActiveRecord::Migration[6.0]
  def change
    add_column :actives, :end_user_id, :integer
  end
end
