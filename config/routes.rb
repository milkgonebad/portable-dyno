PortableDyno::Application.routes.draw do

  get "events/index"

  get "events/new"

  get "events/create"

  get "events/edit"

  get "events/update"

  get "events/destroy"

  root :to => 'home#index'
  devise_for :users, :skip => [:registrations]
    as :user do # only use the registration routes we need
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  scope "/admin" do # scope the user admin pages so they don't conflict with devise
    resources :users
  end
  match "admin" => 'admin#index'
  resources :events

end
