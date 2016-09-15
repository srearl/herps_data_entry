class SamplingEvent < ActiveRecord::Base

  belongs_to :river_reach, foreign_key: :river_reaches_id

# this controls the "header" when you click on an entry
#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

  def display_name 
    "#{self.id}"
  end

end
