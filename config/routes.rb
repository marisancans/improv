Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  
  root 'welcome#home'
  
  get 'test' => 'welcome#test'
   
  get 'todos' => 'todos#index'
  post 'todo/new' => 'todos#new'
  post 'todo/create' => 'todos#create'
  delete 'todo/destroy/:id(.:format)' => 'todos#destroy'

  resources :lists
    resources :feeds do
      member do
       resources :entries, only: [:index, :show]
      end
      
  end
  #get 'lists' => 'lists#index'
  #post 'list/create' => 'lists#create'
  
end
