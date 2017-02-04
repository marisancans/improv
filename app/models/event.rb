class Event < ActiveRecord::Base
    belongs_to :user
    validates :name, :start_time, presence: true
    
    COLORS = %w{ red green blue yellow  }
    validates :color, inclusion: { in: COLORS }
    #end_time has to be added
    
    scope :get_from_date, ->(date) {where(start_time: date.in_time_zone.beginning_of_day..date.in_time_zone.end_of_day ).order(start_time: :asc) }
    scope :get_from_month_in_advance, -> {where(start_time: Date.current.in_time_zone..Date.current.in_time_zone + 1.month ).order(start_time: :asc) }
    scope :get_todays_events, -> {where(start_time: Date.current.in_time_zone..Date.current.in_time_zone.end_of_day ).order(start_time: :asc) }
    
    
end
