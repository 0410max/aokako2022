class CreateBoalds < ActiveRecord::Migration[6.0]
  def change
    create_table :boalds do |t|

      t.timestamps
    end
  end
end
