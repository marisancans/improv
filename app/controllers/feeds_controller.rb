class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscribed_feeds, only: [:index]
  before_action :set_unsubscribed_feeds, only: [:index]
  
  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.save
  end

  def update
  end

  def destroy
  end
  
  def show
    @feed = Feed.find(params[:id])
  end
  
  def fetch
    @feeds = Feed.first
  end
  
  private
  
  def set_subscribed_feeds
    @subscribed_feeds = SubscribedFeed.subscribed(current_user)
  end
  
  def set_unsubscribed_feeds
    @unsubscribed_feeds = Feed.unsubscribed(current_user, @subscribed_feeds)
  end
  
  def set_feed
    @feed = current_user.feeds.find(params[:id])
  end
  
  def feed_params
    params.require(:feed).permit(:name, :url, :description).merge(user_id: current_user.id)
  end
  
end
