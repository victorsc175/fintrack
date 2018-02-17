require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:stock) { FactoryBot.create(:stock) }
  let(:ticker) { 'GOOG' }
  describe '.find_by_ticker' do
    it 'returns nil if stock does not exists' do
      expect(described_class.find_by_ticker(ticker)).to be_nil
    end
    it 'returns stock if exists' do
      stock
      expect(described_class.find_by_ticker(ticker).ticker).to eq(ticker) 
    end
  end
  
  describe '.new_from_lookup' do
    it 'creates Stock instance' do
      expect(described_class.new_from_lookup(ticker)).to be_an_instance_of(described_class)
    end
  end
  
  describe '.price' do
    let(:new_stock) { StockQuote::Stock.quote(ticker) }
    it 'returns open or last price' do
      expect(described_class.price(new_stock)).to be > 0
    end
  end
end
