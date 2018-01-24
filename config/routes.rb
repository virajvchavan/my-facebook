Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users, only: [:index, :new, :create] do
    resources :addresses, only: [:index, :new, :create]
  end
end
