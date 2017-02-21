Rails.application.routes.draw do

  namespace :public do
  get 'welcome/index'
  end

  devise_for :admins
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  
  root 'welcome#home'
  
  get 'test' => 'welcome#test'
   
  resources :events do
    collection do
      get 'fetch'
      put 'update_multiple'
    end
  end
  
  namespace :public do
    root :to => "welcome#index"
    resources :welcome do
    end
    
    get '/hours/' => 'welcome#hours', :as => 'hours'
    
  end
  
  resources :lists
    resources :feeds do
      member do
       resources :entries, only: [:index, :show]
      end
  end
  
  resources :galleries do
    resources :gallery_images, :only => [:create, :destroy]
    post 'delete_get_data', on: :member
  end
  
  resources :subscribed_feeds, only: [:create, :destroy]
  
end
