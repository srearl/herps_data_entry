class HerpTaxon < ActiveRecord::Base

  has_many :sampling_events_observations, foreign_key: :herp_taxon_id
  has_many :surveys_observations, foreign_key: :herp_taxon_id
#  belongs_to :river_reach, foreign_key: :river_reaches_id
#  has_many :observers
#  has_many :sampling_events_observations, foreign_key: :sampling_event_id
#  has_many :persons, through: :observers # cannot discern if this is accomplishing anything

  def display_name 
    "#{self.code} - #{self.common_name}"
  end

end

