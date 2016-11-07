class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #Passes all current user event lists
    @events = current_user.events
    @event = Event.new
  end
  
  def new
    #Creates empty object from event class
    
  end
  
  def create
    @event = event.new(event_params)
    respond_to do |format|
      if @event.save
        format.json { render json: @event, status: :created, location: @event }
        format.js { flash.now[:success] = "event created" }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :due_to).merge(user_id: current_user.id)
    end
  

  
end