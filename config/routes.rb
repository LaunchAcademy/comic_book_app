Rails.application.routes.draw do
  devise_for :users

  get '/comic_books/:comic_book_id/reviews/:id/upvote', to: 'votes#upvote'
  get '/comic_books/:comic_book_id/reviews/:id/downvote', to: 'votes#downvote'

  resources :comic_books do
    collection do
      get 'search'
    end
    resources :reviews, only: [:create, :update, :edit] do
      member do
        get 'upvote'
        get 'downvote'
      end
    end
  end

  root 'comic_books#index'
end
