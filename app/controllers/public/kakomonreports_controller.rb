class Public::KakomonreportsController < ApplicationController
  def create
    report = current_end_user.kakomonreports.new(report_params)
    report.kakomon_id = params[:kakomon_id]
    report.end_user_id = current_end_user.id
    report.save
  end

  private

  def report_params 
    params.require(:kakomonreport).permit(:report,:kakomon_id,:end_user_id)
  end
end

