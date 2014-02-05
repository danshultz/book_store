BookStore::Application.routes.draw do
  resources :books

  devise_for :users
  root :to => "home#index"
end
