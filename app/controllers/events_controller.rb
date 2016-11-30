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
  
  def fetch
    if params[:start_time].present?
      respond_to do |format|
        start_time = params[:start_time].to_datetime
        @date = params[:start_time]
        @events = current_user.events.get_from_date(start_time).order(start_time: :asc)
        format.js
      end
    end
  end
  
  def create
    if params[:events].present?
      current_user.events.update(params[:events].keys,params[:events].values)
    end
    
    if params[:new_events].present?
      params[:new_events].each_with_object({}) do |e|
        Event.create(name: e[:name], user_id: current_user.id, start_time: params[:start_time])
      end
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
      params.require(:events).permit(:id, :name, :start_time, :user_id, new_events: [:name])
    end
    
    # def new_event_params
    #   permit(:new_events => [:name])
    # params.require(:events).permit(:name, { data: params[:product][:data].try(:keys) })
    # end
    
 
   
    
    
    
  

  
end