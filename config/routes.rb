BookStore::Application.routes.draw do
  resources :books, :only => [:index, :show]
  resource :shopping_cart

  namespace :admin do
    resources :books
  end

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root :to => "home#index"
end
