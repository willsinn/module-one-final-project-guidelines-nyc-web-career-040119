class Swimmer < ActiveRecord::Base
  has_many :swim_event_times
  has_many :events, through: :swim_event_times

  def gender_string
    self.gender ? "Male" : "Female"
  end
end
