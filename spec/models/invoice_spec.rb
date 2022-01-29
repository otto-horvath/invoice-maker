require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'with failing validations' do
    subject(:invoice) { described_class.new }

    before { invoice.valid? }

    it { expect(invoice).to_not be_valid }

    it 'tests required fields' do
      expect(invoice.errors.messages).to include(number: ["can't be blank"])
      expect(invoice.errors.messages).to include(total_value: ["can't be blank"])
    end
  end
end
