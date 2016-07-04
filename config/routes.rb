Rails.application.routes.draw do

  devise_for :users
  
  root 'welcome#home'
   
  get 'todos' => 'todos#index'
  post 'todo/new' => 'todos#new'
  post 'todo/create' => 'todos#create'
  
  get 'lists' => 'lists#index'
  post 'list/new' => 'lists#new'
  post 'list/create' => 'lists#create'
  
end
