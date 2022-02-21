class AddCommentToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :comment, :text
  end
end
