class AddReportToBoardreports < ActiveRecord::Migration[6.0]
  def change
    add_column :boardreports,:status,:boolean, default:false
  end
end
