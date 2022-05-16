class CreateKakomonreports < ActiveRecord::Migration[6.0]
  def change
    create_table :kakomonreports do |t|
      t.integer :report
      t.integer :kakomon_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end
