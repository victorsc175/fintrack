require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe UserStocksController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # UserStock. As you add validations to UserStock, be sure to
  # adjust the attributes here as well.

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UserStocksController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let(:user) { FactoryBot.create :user }
  let(:stock) { FactoryBot.create :stock }
  let(:user_stock) { FactoryBot.create :user_stock, user: user, stock: stock }
  let(:ticker) { 'RT' }
  let(:incorrect_ticker) { 'FAKE' }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new UserStock for locally stored stock' do
      expect do
        post :create, params: { stock_id: stock.id }, session: valid_session
      end.to change(user.stocks, :count).by(1)
      expect(assigns(:user_stock)).to eq(user.user_stocks.first)
      expect(response).to redirect_to(my_portfolio_path)
    end

    it 'creates UserStock for new stock' do
      expect do
        post :create, params: { stock_ticker: ticker }, session: valid_session
      end.to change(user.stocks, :count).by(1)
      expect(response).to redirect_to(my_portfolio_path)
    end
    
    it 'creates UserStock for stock loaded earlier' do
      expect do
        post :create, params: { stock_ticker: stock.ticker }, session: valid_session
      end.to change(user.stocks, :count).by(1)
      expect(response).to redirect_to(my_portfolio_path)
    end
    
    it 'does not create new UserStock for incorrect ticker' do
      post :create, params: { stock_ticker: incorrect_ticker }, session: valid_session
      expect(assigns(:user_stock)).to_not be_valid
      expect(response).to redirect_to(my_portfolio_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested user_stock' do
      user_stock
      expect do
        delete :destroy, params: { id: user_stock.to_param }, session: valid_session
      end.to change(UserStock, :count).by(-1)
    end

    it 'redirects to the user_stocks list' do
      user_stock
      delete :destroy, params: { id: user_stock.to_param }, session: valid_session
      expect(response).to redirect_to(my_portfolio_path)
    end
  end
end
