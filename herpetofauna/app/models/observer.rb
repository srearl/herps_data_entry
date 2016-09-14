class Observer < ActiveRecord::Base

  belongs_to :sampling_event

# this controls the "header" when you click on an entry
#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
