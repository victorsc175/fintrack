require "rails_helper"

RSpec.describe UserStocksController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/user_stocks").to route_to("user_stocks#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_stocks/1").to route_to("user_stocks#destroy", :id => "1")
    end

  end
end
