require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let!(:friend) { FactoryBot.create(:user, email: 'friend@mail.com',
                                           password: 'friend',
                                           first_name: 'Mark',
                                           last_name: 'Bone') }
  let(:stock) { FactoryBot.create :stock }
  let(:valid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  describe 'GET #my_portfolio' do
    it 'returns user and user stocks' do
      stock = FactoryBot.create :stock
      FactoryBot.create :user_stock, user: user, stock: stock
      get :my_portfolio
      expect(assigns(:user)).to eq(user)
      expect(assigns(:user_stocks).first).to be_a(UserStock)
      expect(response).to have_http_status(:success)
    end
    
    it
  end
  
  describe 'GET #my_friends' do
    it 'returns list of friends' do
      FactoryBot.create :friendship, user: user, friend: friend
      get :my_friends
      expect(assigns(:friendships).first).to eq(friend)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'POST #search' do
    it 'returns list of friends with correct request' do
      post :search, params: { search_param: friend.first_name }, session: valid_session
      expect(assigns(:users)).to be_an(Array)
      expect(assigns(:users).size).to be > 0
      expect(response).to have_http_status(:success)
    end
    
    it 'returns empty array with incorrect request' do
      post :search, params: { search_param: '' }, session: valid_session
      expect(assigns(:users)).to be_empty
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'POST #add_friend' do
    it 'adds friend' do
      friend
      post :add_friend, params: { friend: friend }
      user.reload
      expect(user.friends.size).to eq(1)
      expect(response).to have_http_status(302)
    end
  end
  
  describe 'GET #show' do
    it 'shows user with user stocks' do
      stock
      FactoryBot.create :user_stock, user: user, stock: stock
      post :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(assigns(:user_stocks).first).to be_a(UserStock)
    end
  end
end
