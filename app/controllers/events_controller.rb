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
        day = params[:start_time].to_datetime
        @events = current_user.events.where(start_time: day.in_time_zone.beginning_of_day..day.in_time_zone.end_of_day )
        format.js
      end
    end
  end
  
  def create
    # my_class = ClassName.find_or_initialize_by_id(id)
    
    # my_class.update_attributes({
    #   :street_address => self.street_address,
    #   :city_name => self.city_name,
    #   :zip_code => self.zip_code
    # })
    # @event = Event.new(event_params)
    Event.update(params[:events].keys, params[:events].values)
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
      params.require(:events).permit(:id, :name)
    end
  

  
end