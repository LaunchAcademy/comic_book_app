Rails.application.routes.draw do
  devise_for :users

  resources :comic_books do
    collection do
      get 'search'
    end
    resources :ratings, only: [:create, :update, :edit]
  end

  root 'comic_books#index'
end
