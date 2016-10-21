class Todo < ActiveRecord::Base
    validates :title, :due_to, presence: true 
    
     scope :expired, lambda { where([due_to < ?", Time.current]) }
end