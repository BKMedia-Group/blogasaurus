Blogasaurus::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :authors
  resources :categories
  resources :tags
  resources :comments
  root to: 'blogs#index'
end
