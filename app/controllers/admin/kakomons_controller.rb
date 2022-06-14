class Admin::KakomonsController < ApplicationController
    def destroy
        kakomon = Kakomon.find(params[:id])
        kakomonreport = Kakomonreport.find_by(kakomon_id:params[:id])
        kakomon.destroy
        kakomonreport.destroy
        redirect_to request.referer
    end
end