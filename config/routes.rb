Rails.application.routes.draw do
  resources :batches do
    resources :batch_days
    resources :batch_memberships, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
