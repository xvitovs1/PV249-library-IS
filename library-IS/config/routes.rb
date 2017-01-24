Rails.application.routes.draw do
  get 'borrows/new'

  get 'borrows/show'

  get 'borrows/index'

  get 'users/new'
  get 'users/create'

  get 'books/:id/publications/new', to: 'publications#new'

  get 'contact/', to: 'contact#index'

  get 'books/show'
  get 'books/index'
  get 'books/new'
  get '/books/:id', to: 'books#show'
  get '/books/:id/edit', to: 'books#edit'

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

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get 'users/index', to: 'users#index'
  get '/user/profile', to: 'users#profile'
  get '/users/:id', to: 'users#show'
  get '/users/:id/readers/new', to: 'readers#new'
  get '/readers/:id', to: 'readers#show'


  get '/borrows/index'

  resources :authors
  resources :books
  resources :publications
  resources :publishers
  resources :users
  resources :readers
  get 'main_page/index'
  root 'main_page#index'
end
