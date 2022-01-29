Rails.application.routes.draw do
  # root 'invoice#index'

  namespace :api do
    resources :invoices, only: [:index, :show, :create]
  end
end
