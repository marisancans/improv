class WelcomeController < ApplicationController
  before_action :authenticate_user! 
  def home
    @entries = Entry.order(published: :desc) #where user.feeds
    @feeds = Feed.all
  end  
end
