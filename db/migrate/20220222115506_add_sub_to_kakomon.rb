class AddSubToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :sub, :string
  end
end
