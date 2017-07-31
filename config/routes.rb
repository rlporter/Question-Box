Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :new, :create]
  root to: "posts#index"

  concern :paginatable do
  get '(page/:page)', action: :index, on: :collection, as: ''
end

  resources :my_resources, concerns: :paginatable

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
