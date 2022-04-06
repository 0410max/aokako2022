class AddImage5ToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :image5, :string
  end
end
