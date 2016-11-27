class Event < ActiveRecord::Base
    belongs_to :user
    validates :name, :start_time, presence: true
    #end_time has to be added
    
    scope :get_from_date, ->(date) {where(start_time: date.in_time_zone.beginning_of_day..date.in_time_zone.end_of_day ) }
end
