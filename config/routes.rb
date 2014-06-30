Rails.application.routes.draw do
  root :to => redirect('/bookshelves')
  devise_for :users
  resources :bookshelves
  resources :books
  # resources :books do
  #   post :add_to_bookshelf, :to => :show
  # end

end
