Rails.application.routes.draw do

  devise_for :users
  
  root 'welcome#home'
   
  get 'todos' => 'todo#index'
  post 'todo/new' => 'todo#new'
  post 'todo/create' => 'todo#create'
  
end
