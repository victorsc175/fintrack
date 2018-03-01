require 'ffaker'
class SendNewsJob < ApplicationJob
  queue_as :default
  DELAY = 3

  def perform(message)
    loop do
      company_name = FFaker::Company.name + ' ' + FFaker::Company.suffix
      message = FFaker::Company.catch_phrase
      full = 'Last news: ' + company_name + ', ' + message
      ActionCable.server.broadcast 'web_notifications', full 
      sleep DELAY
    end
  end
end
