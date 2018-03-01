require 'ffaker'
class SendNewPriceJob < ApplicationJob
  queue_as :default
  SEND_NEWS = 20

  def perform(stock)
    for i in 1..SEND_NEWS do
      company_name = FFaker::Company.name + ' ' + FFaker::Company.suffix
      message = FFaker::Company.catch_phrase
      full = 'Last news: ' + company_name + ', ' + message
      ActionCable.server.broadcast 'web_notifications', full 
      sleep 6
    end
  end
end
