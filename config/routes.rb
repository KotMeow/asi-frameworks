Rails.application.routes.draw do
  resources :languages
  
  root 'languages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
