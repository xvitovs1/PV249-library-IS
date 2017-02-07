Rails.application.routes.draw do
  get 'main_page/index'
  root 'main_page#index'

  get 'contact/', to: 'contact#index'

  get 'books/:id/publications/new', to: 'publications#new'
  get 'authors/:id/books/new', to: 'books#new'
  post 'publishers/add', to: 'publishers#add'

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
  get '/user/profile', to: 'users#profile'
  get '/borrows/:id/return', to: 'borrows#return'
  get '/borrows/:id/prolong', to: 'borrows#prolong'
  post '/publications/search', to: 'publications#search'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  resources :users
  resources :readers
  resources :borrows
  resources :librarians
end
