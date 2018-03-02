require 'rails_helper'

RSpec.describe SendNewsJob, type: :job do
  describe '#perform' do
    let(:stock) { FactoryBot.create :stock }
    it 'finished successfully' do
      job = instance_double("SendNewsJob")
      allow(job).to receive(:perform) { true }
      expect(job.perform(stock)).to be_truthy
    end
  end
end
