Rails.application.routes.draw do
  get 'contact/', to: 'contact#index'

  get 'books/show'
  get 'books/index'
  get 'books/new'
  get '/books/:id', to: 'books#show'
  get '/books/:id', to: 'books#edit'

  get '/authors/add'
  get 'authors/new'
  get 'authors/index'
  get 'authors/:id', to: 'authors#show'
  get 'authors/:id/books/new', to: 'books#new'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  get 'main_page/index'
  root 'main_page#index'
end
