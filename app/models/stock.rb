# Methods for stocks
class Stock < ApplicationRecord
  validates_presence_of :ticker, :name, :last_price
  validates_uniqueness_of :ticker
  has_many :user_stocks
  has_many :users, through: :user_stocks
  class << self
    def find_by_ticker(ticker)
      find_by(ticker: ticker)
    end

    def new_from_lookup(ticker)
      stock = StockQuote::Stock.quote(ticker) rescue nil
      correct?(stock) && new(ticker: stock.symbol,
                             name: stock.name,
                             last_price: price(stock))
    end

    def price(stock)
      eod_price(stock) || open_price(stock)
    end

    def correct?(stock)
      stock.is_a?(StockQuote::Stock) &&
        stock.symbol &&
        !stock.symbol.empty?
    end

    def eod_price(stock)
      eod_price = stock.eo
      eod_price && !eod_price.empty? && eod_price.to_f
    end

    def open_price(stock)
      open_price = stock.op
      return 0 if open_price.blank?
      open_price.delete(',').to_f
    end
  end
end
