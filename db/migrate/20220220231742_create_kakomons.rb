class CreateKakomons < ActiveRecord::Migration[6.0]
  def change
    create_table :kakomons do |t|
      t.text :image
      t.integer :year
      t.string :prof

      t.timestamps
    end
  end
end
