require 'ffaker'
class SendNewsJob < ApplicationJob
  queue_as :default
  DELAY = 4

  def perform(message)
    loop do
      company = FFaker::Company
      company_name = company.name + ' ' + company.suffix
      message = company.catch_phrase
      full = 'Hot News: ' + company_name + ', ' + message
      ActionCable.server.broadcast 'web_notifications', full 
      sleep DELAY
    end
  end
end
