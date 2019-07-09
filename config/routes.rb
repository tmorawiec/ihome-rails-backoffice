Rails.application.routes.draw do


  # root :to => "users#index"
  root :to => "permission_policies#index"

  resources :permission_policies
  
  # example: http://localhost:3000/my/users/sign_up
  devise_for :users, :path_prefix => 'my'
  
  resources :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  get 'userzy' => "users#userzy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
