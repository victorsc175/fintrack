require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  
  let(:user) { FactoryBot.create(:user) }
  
  let(:valid_session) { {} } 
  
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end