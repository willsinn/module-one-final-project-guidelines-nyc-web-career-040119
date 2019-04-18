class Event < ActiveRecord::Base
  has_many :swim_event_times
  has_many :swimmers, through: :swim_event_times
  def gender_e
    self.gender ? "male" : "female"
  end
end
