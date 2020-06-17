Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new, :index]
  resource :session, only: [:create, :new, :destroy]
  
  resources :categories, only: [:create, :new, :index] do
    resources :games, only: [:create]
  end
  
  resources :questions, only: [:create, :new] do 
    resources :taggings, only: [:create, :new]
  end

  resources :games, only: [:show, :update]
end
