class Admin::KakomonsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @kakomons = Kakomon.all.order(id: "DESC") 
        @kakomons = @kakomons.page(params[:page]).per(30)
        @boards = Board.all.order(id: "DESC") 
    end

    def destroy
        kakomon = Kakomon.find(params[:id])
        if Kakomonreport.find_by(kakomon_id:params[:id]).present?
            kakomonreport = Kakomonreport.find_by(kakomon_id:params[:id])
            kakomonreport.destroy
        end
        kakomon.destroy
        redirect_to request.referer
    end

    def update
        @kakomons = Kakomon.all.order(id: "DESC") 
        @kakomon = Kakomon.find(params[:id])
        @kakomon.update(status:true)
    end
end

