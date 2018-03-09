require 'ffaker'
class SendNewsJob < ApplicationJob
  queue_as :default
  DELAY = 4

  def perform(_message)
    loop do
      company = FFaker::Company
      company_name = company.name + ' ' + company.suffix
      message = company.catch_phrase
      ActionCable.server.broadcast 'web_notifications',
                                   company_name + ', ' + message
      sleep DELAY
    end
  end
end
