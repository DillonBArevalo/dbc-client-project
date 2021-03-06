Rails.application.routes.draw do
  devise_for :users

  resources :actors, only: [:show] do
    get '/reviews/new', to: 'reviews#actor_new'
    post '/reviews', to: 'reviews#actor_create'
  end

  resources :films, only: [:index, :show] do
    get '/reviews/new', to: 'reviews#film_new'
    post '/reviews', to: 'reviews#film_create'
    get '/comments/new', to: 'comments#film_new'
    post '/comments', to: 'comments#film_create'
    delete '/comments/:id', to: 'comments#film_destroy', as: "comment"
    post '/ratings', to: 'ratings#create_film_rating'
  end

  resources :reviews, except: [:new, :create] do
    post '/ratings', to: 'ratings#create_review_rating'
    get '/comments/new', to: 'comments#review_new'
    post '/comments', to: 'comments#review_create'
    delete '/comments/:id', to: 'comments#review_destroy', as: "comment"
  end

  resources :categories, only: [:index, :show]
  resources :comments, only: [:destroy]

  root "films#index"
end
