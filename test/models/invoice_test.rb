require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  test "validates required invoice number" do
    invoice = Invoice.new
    assert_not invoice.save, "Saved invoice without a number"
  end
end
