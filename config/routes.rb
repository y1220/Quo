Rails.application.routes.draw do
  get 'posts/index'
  #devise_for :users
 # get '/'=> 'home#index'
 devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 
  resources :posts do
    member do

      post "delete"
    end

  end
  namespace :users do
    get "/:id" ,action: "show"
  end

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end
  root 'home#index'
  get 'about' => "home#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
