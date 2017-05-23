Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'

  resources :users, only: [:new, :create]
  get '/chats/main', to: 'chats#main'

  mount ActionCable.server => '/cable'
end
