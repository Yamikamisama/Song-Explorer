Rails.application.routes.draw do
  resources :users, :entries

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'search' => 'entries#search'

  root 'entries#index'

end
