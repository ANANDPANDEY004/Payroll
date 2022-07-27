Rails.application.routes.draw do
 
  get 'chatroom/index'
  get 'chatroom', to: 'chatrooms#index'
  post 'message' , to: 'messages#create'
  
  resources :attandances
  resources :leave_managements do
    post "/accept", to: "leave_managements#accept"
    post "/decline", to: "leave_managements#decline"
  end
  get 'departments/index'
  resources :employees do
    post "/active", to: "employees#actice"
  end
  resources :hrs
  devise_for :users
  root 'home#index'
  get '/widget' , to:"home#widget"
  mount ActionCable.server, at:'/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
