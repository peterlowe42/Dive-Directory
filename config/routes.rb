Rails.application.routes.draw do
  root 'divesites#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
    resources :divesites do
      resources :reviews
    end
  resources :users 
  resources :account_activations, only: [:edit]

end
