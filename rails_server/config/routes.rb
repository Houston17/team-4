Rails.application.routes.draw do
  get 'users/new'

  devise_for :users
  get 'clients/edit_list', to: 'clients#edit_list'
  resources :clients

  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'clients#index'
end
