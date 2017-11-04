Rails.application.routes.draw do
  # We define here a route inside the locale thats just saves the current locale in the session
  devise_for :users, skip: [:session, :password, :registration, :confirmation], controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  localized do
    root 'home#index'

    # We define here a route inside the locale thats just saves the current locale in the session
    get 'omniauth/:provider' => 'omniauth#localized', as: :localized_omniauth
    devise_for :users, skip: :omniauth_callbacks

    get 'about', to: 'home#about'

    get 'users/edit_profile', to: 'users#edit_profile'
    put 'users/update_profile', to: 'users#update_profile'
  end
end
