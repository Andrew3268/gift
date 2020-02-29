Rails.application.routes.draw do
  resources :guides
  get '/posts/index_guide', to:'posts#index_guide'
  root 'posts#index'
  resources :categories
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
