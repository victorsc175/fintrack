class Stock < ApplicationRecord
  class << self
    def find_by_ticker(ticker)
      find_by(ticker: ticker)
    end
  
    def new_from_lookup(ticker)
      stock  = StockQuote::Stock.quote(ticker)
      return nil unless stock.is_a?(StockQuote::Stock)
      new(ticker: stock.symbol,
          name: stock.name,
          last_price: price(stock))
    end
  
    def price(stock)
      return stock.eo.to_f unless stock.eo.empty?
      stock.op.delete(',').to_f
    end
  end
end
