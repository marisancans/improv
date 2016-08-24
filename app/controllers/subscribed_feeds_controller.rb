class SubscribedFeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscribed_feed, only: :destroy
    
  def create
    respond_to do |format|
      @subscribed_feed = SubscribedFeed.new
      if SubscribedFeed.create(subscribed_feed_params) 
          format.json { render json: @subscribed_feed, status: :updated, location: @subscribed_feed }
          format.js { flash.now[:success] = "Subscribed!" }
      else
        format.json { render json: @subscribed_feed.errors, status: :unprocessable_entity }
        format.js { render :error }
      end
    end
  end

  def update
  end

  def destroy
    @subscribed_feed.destroy if current_user.id == @subscribed_feed.user_id
    #VALIDATION & response
  end
  
  private
  
  def set_subscribed_feed
    @subscribed_feed = SubscribedFeed.find(params[:id])
  end
  
  def subscribed_feed_params
    params.permit(:feed_id).merge(user_id: current_user.id)
  end
end
