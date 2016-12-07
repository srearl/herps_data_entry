class PlotLocation < ActiveRecord::Base

  has_many :surveys, foreign_key: :plot_location_id
  belongs_to :river_reach, foreign_key: :river_reaches_id

  def display_name 
    "#{self.rchtscloc_display}"
  end

#  added rchtscloc_display which is reach + tsect + location, so the below is no longer required
#  def display_name
#    result = ""
#    result << "#{self.transect}"
#    result << ", #{self.location}"
#    return result
#  end


end
