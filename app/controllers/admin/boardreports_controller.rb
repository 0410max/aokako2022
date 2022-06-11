class Admin::BoardreportsController < ApplicationController
  def index
    @boards = Boardreport.all
  end
end
