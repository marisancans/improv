Rails.application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
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
  
  resources :subscribed_feeds, only: [:create, :destroy]
  
end
