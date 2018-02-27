require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:stock) { FactoryBot.create :stock }

  let(:valid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #search' do
    it 'returns stock found locally' do
      get :search, params: { stock: stock.ticker }, session: valid_session
      expect(assigns(:stock)).to eq stock
      expect(response).to have_http_status(:success)
    end
  end
end
