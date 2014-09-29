Rails.application.routes.draw do
  devise_for :users

  resources :comic_books do
    collection do
      get 'search'
    end
    resources :ratings, only: [:create, :update, :edit] do
      member do
        get 'upvote', to: 'votes#upvote'
        get 'downvote', to: 'votes#downvote'
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index]
  end

  root 'comic_books#index'
end
