PortableDyno::Application.routes.draw do

  # public routes
  root :to => 'home#index'
  get '/contact' => 'home#contact'
  get '/faq' => 'home#faq'
  get '/about' => 'home#about'
  get '/gallery' => 'home#gallery'
  
  # admin only routes
  match 'admin' => 'admin#index'
  devise_for :users, :skip => [:registrations]
    as :user do # only use the registration routes we need
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  scope '/admin' do # scope the user admin pages so they don't conflict with devise
    resources :users
  end
  resources :events

end
