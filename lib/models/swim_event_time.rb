class SwimEventTime < ActiveRecord::Base
    belongs_to :swimmer
    belongs_to :event

    def time_minutes
      minutes = self.time%2
      seconds = self.time%60
      "#{minutes}.#{seconds}.00"
    end
end
