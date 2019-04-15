class SwimEventTime < ActiveRecord::Database
    belongs_to :swimmer
    belongs_to :event
end
