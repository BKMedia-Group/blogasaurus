Blogasaurus::Engine.routes.draw do
  resources :posts
  resources :authors
  resources :categories
  resources :tags
  resources :comments
  root to: 'blogs#index'
end
