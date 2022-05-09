class AddEndUserIdToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :end_user_id, :integer
  end
end
