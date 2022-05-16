class Public::NokakomonsController < ApplicationController
  def index
    @kakomons = Kakomon.page(params[:page]).per(30).order(created_at: :desc)
  end
end
