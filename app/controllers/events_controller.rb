class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_event, only: [:index, :fetch_for_edit]
  
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
    @events_week_in_advance = current_user.events.get_from_week_in_advance
    @todays_events = current_user.events.get_todays_events
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
    @date = params[:start_time]
  
    respond_to do |format|
      format.js 
    end

  end
  
  def create
    @event = current_user.events.new(event_params)
    @date = @event.start_time
    @events = current_user.events.get_from_date(@date).order(start_time: :asc)
    @events_week_in_advance = current_user.events.get_from_week_in_advance
    
    if @event.save
      initialize_event
      respond_to do |format|
        format.js {}
      end        
    else
      @messages = @event.errors.full_messages
      @message_class = :error
      respond_to do |format|
        format.js { render 'shared/flash_now' }
      end  
    end

  end
  
  private
  
    def initialize_event
      if params[:start_time]
        @event = current_user.events.new(start_time: params[:start_time])
      else
        @event = current_user.events.new(start_time: Date.current)
      end
    end
  
    def event_params
      params.require(:event).permit(:name, :start_time, :color).merge(user_id: current_user.id)
    end

end