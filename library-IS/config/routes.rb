Rails.application.routes.draw do
  get 'books/:id/publications/new', to: 'publications#new'

  get 'contact/', to: 'contact#index'

  get 'books/show'
  get 'books/index'
  get 'books/new'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'

  get 'authors/new'
  get 'authors/index'
  get 'authors/:id', to: 'authors#show'
  get 'authors/:id/books/new', to: 'books#new'
  get 'authors/:id/edit', to: 'authors#edit'
  post 'authors/add', to: 'authors#add'
  post '', to: 'base#search'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  get 'main_page/index'
  root 'main_page#index'

  match '/search', to: 'search#search_all', via: 'post'
end
