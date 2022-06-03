class CreateKakomonComments < ActiveRecord::Migration[6.0]
  def change
    create_table :kakomon_comments do |t|
      t.integer :end_user_id
      t.integer :kakomon_id
      t.text :comment

      t.timestamps
    end
  end
end
