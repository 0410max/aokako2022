class AddEndUserIdToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :end_user_id, :integer
  end
end
