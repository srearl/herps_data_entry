class SamplingEventsObservation < ActiveRecord::Base

  belongs_to :sampling_event, foreign_key: :sampling_event_id
  has_one :river_reach, through: :sampling_event
  belongs_to :herp_taxon

  def observation_date
    self.sampling_event.observation_date unless self.sampling_event.nil? 
  end

  def code
    self.herp_taxon.code unless self.herp_taxon.nil? 
  end


#  def display_name 
#    "#{self.initials}"
#  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
