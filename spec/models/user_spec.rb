require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create :user }
  let(:friend) { FactoryBot.create :user, email: 'friend@mail.com', first_name: 'John', last_name: 'Silver' }
  describe '.search' do
    it 'returns empty set if param is blank' do
      expect(described_class.search('')).to be_empty
    end

    it 'returns set with user found' do
      subject
      expect(described_class.search('Victor').size).to be 1
    end
  end

  describe '#full_name' do
    let(:user) { FactoryBot.create :user, first_name: nil, last_name: nil }
    it 'returns Anonymous unless first_name and last_name added' do
      expect(user.full_name).to eq 'Anonymous'
    end

    it 'returns Anonymous unless first_name and last_name added' do
      expect(subject.full_name).to eq 'Victor S'
    end
  end

  describe '#can_add_stock?' do
    let(:stock) { FactoryBot.create :stock }
    let(:ticker) { 'GOOG' }
    it 'allows to add new stock' do
      expect(subject.can_add_stock?(ticker)).to be_truthy
    end

    it 'protects to add stock if exists already' do
      FactoryBot.create :user_stock, stock: stock, user: subject
      expect(subject.can_add_stock?(ticker)).to be_falsey
    end
  end

  describe '#not_friends_with?' do
    it 'allows to add new friend' do
      expect(subject.not_friends_with?(friend)).to be_truthy
    end

    it 'does not allow to add an old friend' do
      FactoryBot.create :friendship, user: subject, friend: friend
      expect(subject.not_friends_with?(friend)).to be_falsey
    end
  end

  describe '#except_current_user' do
    it 'returns all users except current one' do
      users = [subject, friend]
      expect(subject.except_current_user(users)).to eq([friend])
    end
  end
end
