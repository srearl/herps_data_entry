class Observer < ActiveRecord::Base

  belongs_to :sampling_event
  has_many :persons, foreign_key: :persons_id

  def observation_date
    self.sampling_event.observation_date unless self.sampling_event.nil? 
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
