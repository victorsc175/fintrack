# StocksController
class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end
    respond_to do |format|
      format.js
    end
  end
end
