Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]
  resources :categories, only: [:create, :new, :index]
  resources :questions, only: [:create, :new]
end
