PortableDyno::Application.routes.draw do

  root :to => 'home#index'
  devise_for :users
  
  scope "/admin" do # scope the user admin pages so they don't conflict with devise
    resources :users
  end

  match "admin" => 'admin#index'

end
