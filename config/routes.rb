Rails.application.routes.draw do
  devise_for :users

  resources :comic_books do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :update, :edit, :destroy] do
      member do
        get 'upvote', to: 'votes#upvote'
        get 'downvote', to: 'votes#downvote'
      end
    end
  end

  root 'comic_books#index'
end
