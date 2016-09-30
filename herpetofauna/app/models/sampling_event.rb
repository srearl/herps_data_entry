class SamplingEvent < ActiveRecord::Base

  belongs_to :river_reach, foreign_key: :river_reaches_id
  has_many :observers
  has_many :sampling_events_observations, foreign_key: :sampling_event_id
  has_many :persons, through: :observers # cannot discern if this is accomplishing anything
  has_many :herp_taxons, through: :sampling_events_observations

  def display_name 
    "#{self.id}"
  end

end
