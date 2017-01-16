Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  
  root 'welcome#home'
  
  get 'test' => 'welcome#test'
   
  resources :events do
    collection do
      get 'fetch_for_edit'
    end
  end
  
  resources :lists
    resources :feeds do
      member do
       resources :entries, only: [:index, :show]
      end
  end
  
  resources :subscribed_feeds, only: [:create, :destroy]
  
end
