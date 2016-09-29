class Observer < ActiveRecord::Base

  belongs_to :sampling_event
  has_one :river_reach, through: :sampling_event
  has_one :person, foreign_key: :person_id

  def observation_date
    self.sampling_event.observation_date unless self.sampling_event.nil? 
  end

  def display_name 
    "#{self.id}"
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
