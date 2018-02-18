require 'rails_helper'

RSpec.describe "UserStocks", type: :request do
  describe "GET /user_stocks" do
    it "works! (now write some real specs)" do
      get user_stocks_path
      expect(response).to have_http_status(200)
    end
  end
end
