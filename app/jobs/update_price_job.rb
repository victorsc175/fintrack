class UpdatePriceJob < ApplicationJob
  queue_as :default
  BASE_FOR_CHANGE = 10
  BASE_FOR_DELAY = 15

  def perform(*args)
    loop do
      stocks_total = Stock.count
      stock = Stock.offset(rand(stocks_total)).limit(1).first
      old_price = stock.last_price
      change = (-BASE_FOR_CHANGE..BASE_FOR_CHANGE).to_a.sample * 0.1
      direction = change > 0 ? 'up' : 'down'
      new_price = stock.last_price + change
      new_price = 0 if new_price < 0
      stock.update(last_price: new_price.round(2))
      sleep BASE_FOR_DELAY / stocks_total.to_f
      ActionCable.server.broadcast 'price_update',
                                  { stock_id: stock.id,
                                    last_price: stock.last_price,
                                    direction: direction }
    end
  end
end
