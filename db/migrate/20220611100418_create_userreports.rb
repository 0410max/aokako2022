class CreateUserreports < ActiveRecord::Migration[6.0]
  def change
    create_table :userreports do |t|
      t.integer :report, null: false
      t.integer :user_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end
