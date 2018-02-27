# WelcomeController
class WelcomeController < ApplicationController
  def index
    WebNotificationsChannel.broadcast_to(
      current_user,
      title: 'New things!',
      body: 'All the news fit to print'
    )  
  end
end
