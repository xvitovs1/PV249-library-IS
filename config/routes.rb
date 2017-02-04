Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'

  get 'contact/', to: 'contact#index'

  get 'books/index'
  get 'books/new'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'
  get 'books/:id/publications/new', to: 'publications#new'

  get 'authors/new'
  get 'authors/index'
  post 'authors/add', to: 'authors#add'
  get 'authors/:id', to: 'authors#show'
  get 'authors/:id/books/new', to: 'books#new'
  get 'authors/:id/edit', to: 'authors#edit'

  get 'publishers/new', to: 'publishers#new'
  post 'publishers/add', to: 'publishers#add'
  get 'publishers/:id', to: 'publishers#show'
  get 'publishers/:id/edit', to: 'publishers#edit'

  post '/search', to: 'search#search_all'
  post '/search_books', to: 'search#search_books'
  post '/search_authors', to: 'search#search_authors'
  post '/search_publishers', to: 'search#search_publishers'
  post '/search_users', to: 'search#search_users'
  post '/search_borrows', to: 'search#search_borrows'
  post '/search_by_isbn', to: 'search#search_books_by_isbn'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/librarians/denied', to: 'librarians#denied'

  get '/signup', to: 'users#new'
  get '/users/index', to: 'users#index'
  get '/user/profile', to: 'users#profile'
  get '/users/:id/edit', to: 'users#edit'
  get '/users/:id', to: 'users#show'
  get '/users/:id/readers/new', to: 'readers#new'
  get '/users/:id/librarians/new', to: 'librarians#new'
  get '/readers/:id', to: 'readers#show'
  get '/readers/:id/edit', to: 'readers#edit'
  get '/librarians/:id/edit', to: 'librarians#edit'

  get 'borrows/index'
  get 'borrows/:id/notify', to: 'borrows#notify'
  get 'users/:id/borrows/new', to: 'borrows#new'
  get 'borrows/:id', to: 'borrows#show'
  get 'borrows/:id/return', to: 'borrows#return'
  get 'borrows/:id/prolong', to: 'borrows#prolong'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  resources :users
  resources :readers
  resources :borrows
  resources :librarians
  get 'main_page/index'
  root 'main_page#index'
end