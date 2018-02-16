class Stock < ApplicationRecord
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  def self.new_from_lookup(ticker_symbol)
    looked_up_stock  = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price(looked_up_stock)
    new_stock
  end
  
  def price(stock)
    closing_price = stock.eo
    return "#{closing_price} (Closing)" unless closing_price.empty?
    opening_price = stock.op
    return "#{opening_price} (Opening)" unless opening_price.empty?
    'Unavailable'
  end
end
