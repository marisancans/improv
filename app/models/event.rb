class Event < ActiveRecord::Base
    belongs_to :user
    validates :name, :start_time, presence: true
    
    COLORS = %w{ red green blue yellow  }
    validates :color, inclusion: { in: COLORS }
    
    scope :get_from_date, ->(date) {where(start_time: date.in_time_zone.beginning_of_day..date.in_time_zone.end_of_day ).order(start_time: :asc) }
    scope :get_from_week_in_advance, -> {where(start_time: Date.current.in_time_zone..Date.current.in_time_zone + 1.week ).order(start_time: :asc) }
    scope :get_todays_events, -> {where(start_time: Date.current.in_time_zone..Date.current.in_time_zone.end_of_day ).order(start_time: :asc) }
    
    
end
