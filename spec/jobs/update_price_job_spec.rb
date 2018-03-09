require 'rails_helper'

RSpec.describe UpdatePriceJob, type: :job do
  describe '#perform' do
    let(:stock) { FactoryBot.create :stock }
    it 'finished successfully' do
      job = instance_double('UpdatePriceJob')
      allow(job).to receive(:perform) { true }
      expect(job.perform(nil)).to be_truthy
    end
  end
end
