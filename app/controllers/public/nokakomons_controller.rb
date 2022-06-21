class Public::NokakomonsController < ApplicationController
  def index
    @kakomons = Kakomon.find(Kakomonfavorite.group(:kakomon_id).order('count(kakomon_id) desc').pluck(:kakomon_id))
    @kakomons = Kaminari.paginate_array(@kakomons).page(params[:page]).per(30)
    @report = Kakomonreport.new
  end
end

