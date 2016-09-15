class SamplingEventsObservation < ActiveRecord::Base

#  self.table_name = "persons"
  belongs_to :sampling_event, foreign_key: :sampling_events_id

#  def display_name 
#    "#{self.initials}"
#  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
