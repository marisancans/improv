class WelcomeController < ApplicationController
  before_action :authenticate_user! 
  def home
    @subscribed_feeds = SubscribedFeed.subscribed(current_user)
    @entries = Entry.user_entries(@subscribed_feeds).limit(25).order(published: :desc)
    @events_week_in_advance = current_user.events.get_from_week_in_advance
    
    @message  = current_user.messages.build
    @messages = Message.includes(:user).last(20)
  end  
end
