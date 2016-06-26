Rails.application.routes.draw do

  devise_for :users
  
  root 'welcome#home'
   
  get 'todos' => 'todo#index'
  
end
