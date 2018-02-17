require 'rails_helper'

RSpec.describe StocksController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  
  let(:valid_session) { {} } 
  
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #search" do
    xit "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
  end

end
