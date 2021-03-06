class UserStocksController < ApplicationController
  def create
    new_by_stock
    respond_to do |format|
      format.html do
        redirect_to_portfolio(@user_stock.save)
      end
    end
  end

  def destroy
    @user_stock = UserStock.find(params[:id])
    @user_stock.destroy
    respond_to do |format|
      format.html do
        redirect_to my_portfolio_path,
                    notice: 'Stock was successfully removed from portfolio.'
      end
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
    attr = stock && stock.save ? { stock: stock, user: current_user } : {}
    @user_stock = UserStock.new(attr)
  end

  def redirect_to_portfolio(saved)
    if saved
      ticker = @user_stock.stock.ticker
      message = { notice: "Stock #{ticker} was successfully added" }
    else
      message = { error: 'Stock cannot be created' }
    end
    redirect_to my_portfolio_path, message
  end
end
