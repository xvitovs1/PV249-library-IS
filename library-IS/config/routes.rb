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

  post 'publishers/add', to: 'publishers#add'
  get 'publishers/:id', to: 'publishers#show'
  get 'publishers/:id/edit', to: 'publishers#edit'
  get 'books/:id/edit', to: 'books#add'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  get 'main_page/index'
  root 'main_page#index'

  post '/search', to: 'search#search_all'
  post '/search_books', to: 'search#search_books'
  post '/search_authors', to: 'search#search_authors'
  post '/search_publishers', to: 'search#search_publishers'
end
