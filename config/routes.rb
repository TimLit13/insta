Rails.application.routes.draw do
  root 'pages#home'
  resources :pages
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :users, only: [:show]
  resources :posts, only: [:index, :show, :create] do
    resources :photos, only: [:create]
  end

end
