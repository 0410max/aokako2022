class RemoveSubjectFromActivity < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :subject, :integer
  end
end
