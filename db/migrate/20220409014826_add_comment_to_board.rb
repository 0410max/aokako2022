class AddCommentToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :comment, :text
  end
end
