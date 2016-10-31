class SurveysObservation < ActiveRecord::Base

  belongs_to :survey, foreign_key: :survey_id
  belongs_to :herp_taxon
  has_one :plot_location, through: :survey

  def display_name 
    "#{self.id}"
  end

#  def transect_location
#    result = ""
#    unless(self.plot_location.nil?)
#      result << "#{self.plot_location.transect}"
#    end
#    unless(self.plot_location.nil?)
#      result << ", #{self.plot_location.location}"
#    end
#    return result
#  end

#  def observation_date
#    self.sampling_event.observation_date unless self.sampling_event.nil? 
#  end

#  def code
#    self.herp_taxon.code unless self.herp_taxon.nil? 
#  end


#  def observation_date
#    self.sampling_event.observation_date unless self.sampling_event.nil? 
#  end

end
