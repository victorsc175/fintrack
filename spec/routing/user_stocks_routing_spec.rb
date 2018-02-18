require "rails_helper"

RSpec.describe UserStocksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_stocks").to route_to("user_stocks#index")
    end

    it "routes to #new" do
      expect(:get => "/user_stocks/new").to route_to("user_stocks#new")
    end

    it "routes to #show" do
      expect(:get => "/user_stocks/1").to route_to("user_stocks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_stocks/1/edit").to route_to("user_stocks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_stocks").to route_to("user_stocks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_stocks/1").to route_to("user_stocks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_stocks/1").to route_to("user_stocks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_stocks/1").to route_to("user_stocks#destroy", :id => "1")
    end

  end
end
