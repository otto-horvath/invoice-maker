require 'rails_helper'

RSpec.describe Api::InvoicesController, type: :controller do
  let(:json_response) { JSON.parse(response.body) }

  describe "GET #index" do
    before do
      3.times { |i| Invoice.create(number: i, total_value: 100.0) }
    end

    it "returns http success" do
      get :index

      expect(response).to have_http_status(:success)
      expect(json_response['invoices']).to be_present
    end
  end

  describe "GET #show" do
    context "when finds the requested invoice" do
      let(:invoice) { Invoice.create(number: 1, total_value: 100.0) }

      it "returns http success" do
        get :show, params: { id: invoice.id }
        expect(response).to have_http_status(:success)
        expect(json_response).to include('number' => 1)
      end
    end

    context "when fails to find requested invoice" do
      it "returns http not found" do
        get :show, params: { id: 1 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, params: { invoice: { number: 2, total_value: 100.0 } }

      expect(response).to have_http_status(:created)
      expect(json_response).to include('id')
    end
  end
end
