class SubscribedFeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscribed_feed, only: :destroy
    
  def create
    @subscribed_feed = SubscribedFeed.new(subscribed_feed_params)
    respond_to do |format|
      if @subscribed_feed.save
        format.js
      else
        format.json { render json: @subscribed_feed.errors, status: :unprocessable_entity }
        # format.json { render :json => { :error => @order.errors } }
      end
    end
  end

  def update
  end

  def destroy
    @subscribed_feed.destroy if current_user.id == @subscribed_feed.user_id
    #VALIDATION & response
  end
  
  def set_feed
    @feed = SubscribedFeed.find(@subscribed_feed.id)
  end
  
  private
  
  def set_subscribed_feed
    @subscribed_feed = SubscribedFeed.find(params[:id])
  end
  
  def subscribed_feed_params
    params.permit(:feed_id).merge(user_id: current_user.id)
  end
end
