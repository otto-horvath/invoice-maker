require 'rails_helper'

RSpec.describe Invoice, type: :model do
  context 'validations' do
    subject(:invoice) { described_class.new }

    before { invoice.valid? }

    it { expect(invoice).to_not be_valid }
  end
end
