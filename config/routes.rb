Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'
  root to: "posts#index"

  resources :users
  resources :posts, only: [:index, :show, :new, :create] do
    resources :answers, only: [:index, :new, :create]
  end


  concern :paginatable do
  get '(page/:page)', action: :index, on: :collection, as: ''
end

  resources :my_resources, concerns: :paginatable

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
