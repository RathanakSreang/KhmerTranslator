Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"
  resources :pages, only: :show
  namespace :admin do
    root "pages#index"
    resources :pages
    resources :users
    resources :sliders
    resources :side_menus
  end
end
