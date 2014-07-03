Blogasaurus::Engine.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts do
    get 'archive/:year(/:month)', action: 'archive', on: :collection, as: :archive
  end
  resources :authors
  resources :categories
  resources :tags
  resources :comments
  root to: 'posts#index'
end
