module Api
  class InvoicesController < Api::ApplicationController
    def index
      render json: { invoices: Invoice.all }
    end

    def show
      render json: Invoice.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      head :not_found
    end

    def create
      invoice = Invoice.create(invoice_params)
      render json: invoice, status: :created
    end

    private

    def invoice_params
      params.require(:invoice).permit(:number, :total_value, :origin, :destiny, :issued_at)
    end
  end
end