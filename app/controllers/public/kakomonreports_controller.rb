class Public::KakomonreportsController < ApplicationController
  def create
    kakomon = Kakomon.find(params[:kakomon_id])
    report = current_end_user.kakomonreports.new(report_params)
    report.kakomon_id = kakomon.id
    report.save
    flash[:notice] = '報告されました'
    redirect_to request.referer
  end

  private

  def report_params 
      params.require(:kakomonreport).permit(:report)
  end
end
