class CreateActives < ActiveRecord::Migration[6.0]
  def change
    create_table :actives do |t|
      t.integer :subject_id
      t.integer :user_id
      t.string :action_type
      t.boolean :read

      t.timestamps
    end
  end
end
