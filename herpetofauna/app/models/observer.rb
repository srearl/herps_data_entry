class Observer < ActiveRecord::Base

  has_many :sampling_events, foreign_key: :sampling_events_id
  has_many :persons, foreign_key: :persons_id

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
