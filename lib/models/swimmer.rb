class Swimmer < ActiveRecord::Base
  has_many :swim_event_times
  has_many :events, through: :swim_event_times

  def gender_s
    self.gender ? "male" : "female"
  end

end
# Swimmer joining EVENTS
# User.where(weekly_subscriber: true).find_each do |user|
#   NewsMailer.weekly(user).deliver_now
# end
