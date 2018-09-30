Rails.application.routes.draw do

  get 'posts/index'
  devise_for :users, controllers: { registrations: "registrations" }

  get 'pages/home'
  get 'pages/welcome'
  
  root 'pages#home'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
