require 'ffaker'
class SendNewPriceJob < ApplicationJob
  queue_as :default

  def perform(stock)
    ActionCable.server.broadcast 'price_update', { stock_id: stock.id, last_price: stock.last_price }
  end
end
