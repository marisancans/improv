class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :destroy, :update]
  def index
    @feeds = current_user.feeds
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
    @feeds = current_user.feeds
  end
  
  def fetch
    @feeds = Feed.first
  end
  
  private
  
  def set_feed
    @feed = current_user.feeds.find(params[:id])
  end
  
  def feed_params
    params.require(:feed).permit(:name, :url, :description).merge(user_id: current_user.id)
  end
  
end
