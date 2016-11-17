class Event < ActiveRecord::Base
    belongs_to :user
    validates :name, :start_time, presence: true
    #end_time has to be added
end
