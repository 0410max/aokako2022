class RemoveImageFromKakomon < ActiveRecord::Migration[6.0]
  def change
    remove_column :kakomons, :image, :text
  end
end
