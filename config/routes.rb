Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :index, :edit,:update]

  resources :books

  root to: 'books#top'

  get '/about' => 'books#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
