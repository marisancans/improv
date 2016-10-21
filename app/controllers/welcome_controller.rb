class WelcomeController < ApplicationController
  before_action :authenticate_user! 
  def home
    @subscribed_feeds = SubscribedFeed.subscribed(current_user)
    @entries = Entry.user_entries(@subscribed_feeds).limit(25).order(published: :desc)
    @todos = current_user.todos
  end  
end
