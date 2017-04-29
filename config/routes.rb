Rails.application.routes.draw do
  get 'location/fetch'

  Rails.application.routes.draw do

  get 'location' => 'location#fetch'

  namespace :public do
    get 'welcome/index'
  end

  devise_for :admins
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root 'welcome#home'
  
  resources :messages
  
  get 'test' => 'welcome#test'
   
  resources :events do
    collection do
      get 'fetch'
      put 'update_multiple'
    end
  end
  
  namespace :public do
    root :to => "welcome#index"
    resources :welcome
  
    get '/hours/' => 'welcome#hours', :as => 'hours'
    get '/physics/' => 'welcome#physics', :as => 'physics'
    
  end
  
  resources :lists
    resources :feeds do
      member do
       resources :entries, only: [:index, :show]
      end
    end
  end
  
  resources :galleries do
    resources :gallery_images, :only => [:create, :destroy]
    post 'delete_get_data', on: :member
  end
  
  resources :subscribed_feeds, only: [:create, :destroy]
  
  mount ActionCable.server, at: '/cable'
end
