class Public::BoardreportsController < ApplicationController
  def create
    report = current_end_user.boardreports.new(report_params)
    report.board_id = params[:board_id]
    report.end_user_id = current_end_user.id
    report.save
    flash[:notice] = '報告されました'
    redirect_to request.referer
  end

  private

  def report_params 
    params.require(:boardreport).permit(:report,:board_id,:end_user_id)
  end
end