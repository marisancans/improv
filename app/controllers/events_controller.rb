class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @event = current_user.events.new(start_time: Date.current)
    @events = current_user.events
    @events_week_in_advance = current_user.events.get_from_week_in_advance
    @todays_events = current_user.events.get_todays_events
  end
  
  # needs reformat
  def fetch
    start_time = event_params[:start_time].to_datetime
    @events = current_user.events.get_from_date(start_time).order(start_time: :asc)
    @event = Event.new(event_params)
    @date = event_params[:start_time]
  
    respond_to do |format|
      format.js 
    end

  end
  
  def create
    @event = current_user.events.new(event_params)
    @date = @event.start_time
    @events = current_user.events.get_from_date(@date).order(start_time: :asc)
    
    if @event.save
      respond_to do |format|
        format.js
      end        
    else
      @messages = @event.errors.full_messages
      @message_class = :error
      respond_to do |format|
        format.js { render 'shared/flash_now' }
      end  
    end
  end
  
  def edit
   respond_to do |format|
     find_event
      format.js
    end  
  end
  
  def update
    @event = current_user.events.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(event_params)
        format.js
      else
        @messages = @event.errors.full_messages
        @message_class = :error
        format.js { render 'shared/flash_now' }
      end
    end 
  end
  
  def destroy
    @event = current_user.events.find(params[:id])
    
    respond_to do |format|
      if @event.destroy
        format.js
      else
        @messages = @event.errors.full_messages
        @message_class = :error
        format.js { render 'shared/flash_now' }
      end
    end 
  end
  
  private
  
    def event_params
      params.require(:event).permit(:name, :start_time, :color).merge(user_id: current_user.id)
    end
    
    def find_event
      @event = current_user.events.find(params[:id])
    end

end