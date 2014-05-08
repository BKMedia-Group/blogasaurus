Rails.application.routes.draw do

  mount Blogasaurus::Engine => "/blog"
  root to: 'junk#test'
end
