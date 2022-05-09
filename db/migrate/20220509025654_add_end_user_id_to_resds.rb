class AddEndUserIdToResds < ActiveRecord::Migration[6.0]
  def change
    add_column :reads, :end_user_id, :integer
  end
end
