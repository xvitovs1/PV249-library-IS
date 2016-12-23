Rails.application.routes.draw do

  get 'main_page/index'
  root 'main_page#index'
end
