Rails.application.routes.draw do
  root'flights#index', as: 'flights'
  get 'flights/index'
  resources :bookings, only: [:new, :create, :index, :show]
end
