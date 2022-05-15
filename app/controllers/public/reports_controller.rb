class Public::ReportsController < ApplicationController
    def create
        kakomon = Kakomon.find(params[:kakomon_id])
        report = current_user.reports.new(report_params)
        report.kakomon_id = kakomon.id
        report.save
        flash[:notice] = '報告されました'
        redirect_to kakomon_path(kakomon)
    end

    private

    def report_params 
        params.require(:report).permit(:report)
    end
end
