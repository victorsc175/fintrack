require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  let(:valid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #my_portfolio' do
    it 'returns http success' do
      get :my_portfolio
      expect(response).to have_http_status(:success)
    end
  end
end
