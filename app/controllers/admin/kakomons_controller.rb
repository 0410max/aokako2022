class Admin::KakomonsController < ApplicationController
    def index
        @kakomons = Kakomon.page(params[:page]).per(30)
        @kakomons = @kakomons.order(create_at: :desc)
    end

    def destroy
        kakomon = Kakomon.find(params[:id])
        if Kakomonreport.find_by(kakomon_id:params[:id]).exist?
            kakomonreport = Kakomonreport.find_by(kakomon_id:params[:id])
            kakomonreport.destroy
        end
        kakomon.destroy
        redirect_to request.referer
    end

    def update
        kakomon = Kakomon.find(params[:id])
        kakomon.update(status:true)
    end

end
