class RiverReach < ActiveRecord::Base

  # belongs_to :sampling_event
  self.table_name = "river_reaches"
  has_many :sampling_events
  # has_many :sampling_events, foreign_key: :river_reaches_id
  
  def display_name 
    "#{reach}"
  end

end
