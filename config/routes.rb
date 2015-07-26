Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    mount Ckeditor::Engine => '/ckeditor'
    devise_for :users
    root "static_pages#home"
    get "static_pages/help"
    get "static_pages/about"  
    namespace :admin do
      root "pages#index"
      resources :pages
      resources :users
      resources :sliders
      resources :side_menus
    end  
    resources :pages , path: '', only: :show
  end

  match "errors/500", to: "errors#500", via: :all
  match "errors/404", to: "errors#404", via: :all
  match "errors/422", to: "errors#422", via: :all
  match "(errors)/:status", to: "errors#show", constraints: {status: /\d{3}/}, via: :all
  
  get "*path", to: redirect("/kh/%{path}"),
    constraints: lambda {|req| !req.path.starts_with?("/kh/") && !req.path.starts_with?("/en/")}
  get "", to: redirect("/kh/")
end
