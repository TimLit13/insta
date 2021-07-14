Rails.application.routes.draw do
  root 'pages#home'
  resources :pages
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resource :users, only: [:show]

end
