class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    #Creates empty object from event class
    @event = Event.new
  end
  
  def index
    @events = current_user.events
    @event = Event.new
    # binding.pry
  end
  
  def fetch_for_edit
    if params[:start_time].present?
      respond_to do |format|
        start_time = params[:start_time].to_datetime
        @date = params[:start_time]
        @events = current_user.events.get_from_date(start_time).order(start_time: :asc)
        if @events.any? 
          format.js 
        else 
          render body: nil
        end
      end
    end
  end
  
  def create
    if params[:events].present?
      current_user.events.update(params[:events].keys,params[:events].values)
    end
    
    if params[:new_events].present?
      # binding.pry
      # params[:new_events].each_with_object({}) do |e|
        # Event.create(name: e[:name], user_id: current_user.id, start_time: e[:start_time])
        # binding.pry
        Event.create(new_event_params)
      # end
    end
      
      respond_to do |format|
        @date = params[:date].to_date 
        @events = current_user.events.get_from_date(@date).order(start_time: :asc)
        format.js { flash.now[:success] = "Updated" }
      end
    # else
    #   render :nothing => true, :status => 400
    # end
  end
  
  private
  
    def event_params
      params.require(:events).permit(:id, :name, :start_time, :user_id)
    end
    
    def new_event_params
      params.require(:new_events).permit(:date, array: [:key1, :key2])
    end
    
 
   
    
    
    
  

  
end