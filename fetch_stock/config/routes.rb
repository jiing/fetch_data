FetchStock::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => "investments#index"
  resources :investments do
    resources :items
  end
end
