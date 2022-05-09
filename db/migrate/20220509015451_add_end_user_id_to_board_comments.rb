class AddEndUserIdToBoardComments < ActiveRecord::Migration[6.0]
  def change
    add_column :board_comments, :end_user_id, :integer
  end
end
