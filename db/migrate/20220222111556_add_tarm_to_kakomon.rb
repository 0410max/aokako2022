class AddTarmToKakomon < ActiveRecord::Migration[6.0]
  def change
    add_column :kakomons, :tarm, :string
  end
end
