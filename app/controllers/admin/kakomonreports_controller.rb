class Admin::KakomonreportsController < ApplicationController
  def index
    @kakomons = Kakomonreport.all
  end
end
