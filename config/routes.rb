Rails.application.routes.draw do
  resources :shops
  devise_for :users
  resources :guides
  get '/posts/index_guide', to:'posts#index_guide'
  get '/posts/shop', to:'posts#shop'
  root 'posts#index'
  resources :categories
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
