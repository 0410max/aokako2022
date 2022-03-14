class ReportsController < ApplicationController
    def create
        kakomon = Kakomon.find(params[:kakomon_id])
        report = current_user.reports.new(report_params)
        report.kakomon_id = kakomon.id
        report.save
        flash[:notice] = '報告されました'
        redirect_to kakomon_path(kakomon)
    end

    def index
        @reports = Report.page(params[:page]).per(10).order(created_at: :desc)
        @number2 = current_user.number.slice(1)
        @number3 = current_user.number.slice(2)
        @number4 = current_user.number.slice(3)
        @number5 = current_user.number.slice(4)
        @number6 = current_user.number.slice(5)
        @number7 = current_user.number.slice(6)
        @number8 = current_user.number.slice(7)
    end

    private

    def report_params 
        params.require(:report).permit(:report)
    end
end
