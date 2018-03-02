require 'rails_helper'

RSpec.describe SendNewPriceJob, type: :job do
  describe '#perform' do
    let(:stock) { FactoryBot.create :stock }
    it 'finished successfully' do
      expect(subject.perform(stock)).to be_truthy
    end
  end
end
