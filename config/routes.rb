Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  
  resources :categories, only: [:create, :new, :index] do
    resources :games, only: [:create]
    resources :highscores, only: [:index]
  end
  
  resources :questions, only: [:create, :new] do 
    resources :taggings, only: [:create, :new]
  end

  resources :highscores, only: [:create]
  get '/highscores', to: 'highscores#main'

  resources :games, only: [:show, :update]
  root to:'sessions#new'
end
