class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    #Creates empty object from event class
    date = params[:date].to_datetime
    @event = Event.new(start_time: date)
    respond_to do |format|
      format.js
    end
  end
  
  def index
    @events = current_user.events
    @this_month_events = current_user.events.get_from_month_in_advance(Date.current).order(start_time: :asc)
    @todays_events = current_user.events.get_todays_events(Date.current).order(start_time: :asc)
  end
  
  def update_multiple
    current_user.events.update(params[:events].keys, params[:events].values) if params[:events].present?
    respond_to do |format|
      @date = params[:date].to_date 
      @events = current_user.events.get_from_date(@date).order(start_time: :asc)
      format.js { flash.now[:success] = "Updated" }
    end
  end
  
  # needs reformat
  def fetch_for_edit
    start_time = params[:start_time].to_datetime
    @events = current_user.events.get_from_date(start_time).order(start_time: :asc)
    
    respond_to do |format|
      
      @date = params[:start_time]
      
      if @events.any? 
        format.js 
      else 
        render 'create'
      end
    end

  end
  
  def create
    @event.new(event_params)
    
    if @event.save
      respond_to do |format|
        format.js
      end
    end

  end
  
  private
  
    def event_params
      params.require(:events).permit(:id, :name, :start_time)
    end

end