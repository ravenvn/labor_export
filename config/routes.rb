Rails.application.routes.draw do
  localized do
    root 'home#index'
    get 'about', to: 'home#about'
    devise_for :users
  end
end
