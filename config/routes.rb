Rails.application.routes.draw do

  devise_for :users
  
  root 'welcome#home'
   
  get 'todos' => 'todo#index'
  post 'todos/new' => 'todo#new'

  
end
