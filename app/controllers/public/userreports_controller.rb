class Public::UserreportsController < ApplicationController
    def create
        @report = current_end_user.userreports.new(report_params)
        @report.end_user_id = current_end_user.id
        @report.user_id = params[:end_user_id]
        @report.save
    end
    
    private

    def report_params 
        params.require(:userreport).permit(:report,:end_user_id,:user_id)
    end
end
