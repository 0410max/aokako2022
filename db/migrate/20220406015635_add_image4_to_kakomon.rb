class AddImage4ToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :image4, :string
  end
end
