Rails.application.routes.draw do

  get 'home/please_confirm'
  get 'favorites/update'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  get '/posts/guide', to:'posts#guide'
  get '/posts/shop', to:'posts#shop'
  get '/posts/popular', to:'posts#popular'
  get '/posts/favorites', to:'posts#favorites'
  
  resources :categories
  resources :shops
  resources :guides

  resources :posts do
    member do
      put "like" => "posts#vote"
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }
 




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
