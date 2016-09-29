class RiverReach < ActiveRecord::Base

  self.table_name = "river_reaches"
  has_many :sampling_events
  
  def display_name 
    "#{reach}"
  end

end
