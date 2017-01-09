Rails.application.routes.draw do
  get 'contact/', to: 'contact#index'

  get 'books/show'
  get 'books/index'
  get 'books/new'
  get '/books/:id', to: 'books#show'

  get '/authors/add'
  get 'authors/new'
  get 'authors/index'
  get 'authors/:id', to: 'authors#show'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  get 'main_page/index'
  root 'main_page#index'
end
