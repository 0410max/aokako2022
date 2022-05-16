class Public::BoardreportsController < ApplicationController
  def create
    board = Board.find(params[:board_id])
    report = current_end_user.boardreports.new(report_params)
    report.board_id = board.id
    report.save
    flash[:notice] = '報告されました'
    redirect_to request.referer
  end

  private

  def report_params 
    params.require(:boardreport).permit(:report)
  end
end