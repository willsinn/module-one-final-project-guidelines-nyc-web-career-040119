class Event < ActiveRecord::Base
  has_many :swim_event_times
  has_many :swimmers, through: :swim_event_times
end
