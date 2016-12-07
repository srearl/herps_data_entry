class Survey < ActiveRecord::Base

  belongs_to :sampling_event, foreign_key: :sampling_event_id
  has_one :river_reach, through: :sampling_event
  belongs_to :plot_location, foreign_key: :plot_location_id
  has_many :surveys_observations, foreign_key: :survey_id, :dependent => :delete_all
  validates_presence_of :sampling_event, :plot_location

  def display_name 
    "#{self.id}"
  end

  def observation_date
    self.sampling_event.observation_date unless self.sampling_event.nil? 
  end

  # added rchtscloc_display to plot_locations which is reach + tsect + location, 
  # so the below is no longer required
  def transect_location
    result = ""
    result << "#{self.sampling_event.river_reach.reach}"
    unless(self.plot_location.nil?)
      result << " - #{self.plot_location.transect}"
    end
    unless(self.plot_location.nil?)
      result << ", #{self.plot_location.location}"
    end
    return result
  end

# example from birds rails app
#    def display_name
#    result = ""
#    unless(self.site.nil?) 
#      result << "#{self.site.display_name}"
#    end
#    result << " on  #{self.survey_date} " 
#    unless(self.time_start.nil?) 
#      result << "(#{self.time_start.strftime("%I:%M%p")}" 
#    else
#      result << "(NULL "
#    end
#    unless(self.time_end.nil?)
#      result << "- #{self.time_end.strftime("%I:%M%p")})" 
#    else
#      result << "- NULL)"
#    end
#    return result
#  end

end
