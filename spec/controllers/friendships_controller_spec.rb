require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:friend) do
    FactoryBot.create :user, email: 'friend@email.com',
                             password: 'friend'
  end
  let(:friendship) { FactoryBot.create :friendship, user: user, friend: friend }
  let(:valid_session) { {} }

  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
  describe 'DELETE #destroy' do
    it 'destory friendship' do
      friendship
      post :destroy, params: { id: friend.id }, session: valid_session
      user.reload
      expect(user.friendships).to be_empty
      expect(response).to have_http_status(302)
    end
  end
end
