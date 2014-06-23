Rails.application.routes.draw do
  devise_for :users
  resources :bookshelves

  resources :books
end
