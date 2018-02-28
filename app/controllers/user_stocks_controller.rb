class UserStocksController < ApplicationController
  def create
    new_by_stock
    respond_to do |format|
      format.html do
        if @user_stock.save
          redirect_to my_portfolio_path,
            notice: "Stock #{@user_stock.stock.ticker} was successfully added"
        else
          redirect_to my_portfolio_path, error: "Stock cannot be created"
        end
      end
    end
  end

  def destroy
    @user_stock = UserStock.find(params[:id])
    @user_stock.destroy
    respond_to do |format|
      format.html { redirect_to my_portfolio_path,
                    notice: 'Stock was successfully removed from portfolio.' }
      format.json { head :no_content }
    end
  end

  private

  def new_by_stock
    if params[:stock_id].present?
      @user_stock = UserStock.new(stock_id: params[:stock_id],
                                  user: current_user)
    else
      new_by_ticker
    end
  end

  def new_by_ticker
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock
      @user_stock = UserStock.new(stock: stock, user: current_user)
    else
      new_by_lookup
    end
  end

  def new_by_lookup
    stock = Stock.new_from_lookup(params[:stock_ticker])
    if stock.save
      @user_stock = UserStock.new(stock: stock, user: current_user)
    else
      @user_stock = nil
      flash[:error] = 'Stock is not available'
    end
  end
end
