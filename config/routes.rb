Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users

  resources :articles do
    member do
      get "like", to: "articles#upvote"
      get "dislike", to: "articles#downvote"
    end
    resources :comments
  end


end
