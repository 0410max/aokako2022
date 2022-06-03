class CreateKakomonfavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :kakomonfavorites do |t|
      t.integer :end_user_id
      t.integer :kakomon_id

      t.timestamps
    end
  end
end
