class AddImageIdToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :image_id, :text
  end
end
