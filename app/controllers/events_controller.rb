class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    #Creates empty object from event class
    @event = Event.new
  end
  
  def index
    @events = current_user.events
    # binding.pry
  end
  
  def fetch
    if params[:start_time].present?
      respond_to do |format|
        start_time = params[:start_time].to_datetime
        @date = params[:start_time]
        @events = current_user.events.where(start_time: start_time.in_time_zone.beginning_of_day..start_time.in_time_zone.end_of_day )
        format.js
      end
    end
  end
  
  def create
    if params[:events].present?
      current_user.events.update(params[:events].keys,params[:events].values)
      @date = params[:date]
    end
    respond_to do |format|
      
      format.js { flash.now[:success] = "Updated" }
    end
    # else
    #   render :nothing => true, :status => 400
    # end
  end
  
  private
  
    def event_params
      params.require(:events).permit(:id, :name)
    end
  

  
end