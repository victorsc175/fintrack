# StocksController
class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock]) ||
               Stock.new_from_lookup(params[:stock])
    end
    respond_to do |format|
      format.js { render 'search.js.erb.coffee' }
      format.html { render 'users/my_portfolio' }
    end
  end
end
