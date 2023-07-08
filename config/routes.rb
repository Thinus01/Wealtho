Rails.application.routes.draw do
  devise_for :users
  root 'main#home'
  resources :categories
  
  get '/transaction', to: 'transactions#index', as: 'transaction'
  get '/transaction/:category_id', to: 'transactions#index', as: 'transaction_category'
  get '/transactions/new/:category_id', to: 'transactions#new', as: 'new_transaction'
  post '/transactions', to: 'transactions#create', as: 'create_transaction'
  resources :transactions, only: [:index, :new, :create]
  get '/main/home', to: 'main#home'
end
