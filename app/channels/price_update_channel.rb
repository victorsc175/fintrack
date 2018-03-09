class PriceUpdateChannel < ApplicationCable::Channel
  def subscribed
    # stream_for current_user
    stream_from 'price_update'
  end
end
