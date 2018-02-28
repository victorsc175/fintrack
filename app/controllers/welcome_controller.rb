# WelcomeController
class WelcomeController < ApplicationController
  def index
    #WebNotificationsChannel.broadcast_to(
    #  current_user,
    #  title: 'New things 1!',
    #  body: 'All the news fit to print'
    #) 
    # Stock.first.update(last_price: 0.16)
    #ActionCable.server.broadcast "web_notifications", { title: 'New things 2!', body: 'All the news fit to print'} 
  end
end
