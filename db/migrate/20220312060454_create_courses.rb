class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :cor_first

      t.timestamps
    end
  end
end
