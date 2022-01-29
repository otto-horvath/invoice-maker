require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'validations' do
    subject(:invoice) { described_class.new }

    before { invoice.valid? }

    it { expect(invoice).to_not be_valid }
    it { expect(invoice.errors[:number]).to be_present }
    it { expect(invoice.errors[:total_value]).to be_present }
  end
end
