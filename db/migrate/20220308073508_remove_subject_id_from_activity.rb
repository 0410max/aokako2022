class RemoveSubjectIdFromActivity < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :subject_id, :integer
  end
end
