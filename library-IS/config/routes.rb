Rails.application.routes.draw do
  get 'authors/new'
  get 'authors/index'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  get 'main_page/index'
  root 'main_page#index'
end
