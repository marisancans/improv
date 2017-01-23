class WelcomeController < ApplicationController
  before_action :authenticate_user! 
  def home
    @subscribed_feeds = SubscribedFeed.subscribed(current_user)
    @entries = Entry.user_entries(@subscribed_feeds).limit(25).order(published: :desc)
    @events = current_user.events.where(start_time: DateTime.current.in_time_zone.beginning_of_day .. DateTime.current.in_time_zone.end_of_month ).order(start_time: :asc)
  end  
end
