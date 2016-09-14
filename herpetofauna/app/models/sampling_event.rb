class SamplingEvent < ActiveRecord::Base

  belongs_to :river_reach
 # belongs_to :RiverReach

# this controls the "header" when you click on an entry
#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
