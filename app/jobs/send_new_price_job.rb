class SendNewPriceJob < ApplicationJob
  queue_as :default

  def perform(stock)
    ActionCable.server.broadcast 'web_notifications', stock.last_price
  end
end
