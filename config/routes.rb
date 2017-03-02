Rails.application.routes.draw do
  get 'users/new'
  get  '/signup',  to: 'users#new'
  resources :languages do
      resources :frameworks
  end
  
  root 'languages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
