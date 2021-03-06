Rails.application.routes.draw do


  resources :histories
  resources :switches
  get "/home/:page" => "home#show"
  root "home#show", page: "home"
  # root :to => "permission_policies#index"

  resources :permission_policies
  
  # example: http://localhost:3000/my/users/sign_up
  # devise_for :users, :path_prefix => 'my'

  devise_for :users,
             :controllers => { :registrations => 'registrations',
                                :sessions => "users/sessions"}

  resources :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  get 'userzy' => "users#userzy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
