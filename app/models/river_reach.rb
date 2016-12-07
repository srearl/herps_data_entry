class RiverReach < ActiveRecord::Base

  self.table_name = "river_reaches"
  has_many :sampling_events
  has_many :plot_locations, foreign_key: :river_reaches_id
  
  def display_name 
    "#{reach}"
  end

end
