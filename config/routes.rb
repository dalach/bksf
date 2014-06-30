Rails.application.routes.draw do
  root :to => redirect('/bookshelves')
  devise_for :users
  resources :bookshelves
  resources :books
  resources :books do
    get :add_to_bookshelf, :to => :show
  end

end
