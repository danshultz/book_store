BookStore::Application.routes.draw do
  resources :books, :only => [:index, :show]

  namespace :admin do
    resources :books
  end

  devise_for :users
  root :to => "home#index"
end
