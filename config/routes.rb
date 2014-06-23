Rails.application.routes.draw do
  root :to => redirect('/bookshelves')
  devise_for :users
  resources :bookshelves
  resources :books
end
