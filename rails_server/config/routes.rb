Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
=======
  get 'clients/edit_list', to: 'clients#edit_list'
>>>>>>> d00348d6dfec4a6db699bc318752c0677d0f8544
  resources :clients

  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'clients#index'
end
