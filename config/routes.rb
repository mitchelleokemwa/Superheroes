Rails.application.routes.draw do
  resources :powers, only: [:show, :index,:update]
  resources :hero_powers, only: [:show, :index, :create, :update]
  resources :heroes, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
