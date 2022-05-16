class Admin::KakomonsController < ApplicationController
  def index
    @reports = Kakomonreport.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
  end
end
