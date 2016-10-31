class SamplingEvent < ActiveRecord::Base

  belongs_to :river_reach, foreign_key: :river_reaches_id
  has_many :observers, :dependent => :delete_all
  has_many :sampling_events_observations, foreign_key: :sampling_event_id, :dependent => :delete_all
  has_many :persons, through: :observers # cannot discern if this is accomplishing anything
  has_many :herp_taxons, through: :sampling_events_observations
  has_many :surveys, foreign_key: :sampling_event_id, :dependent => :delete_all
  validates_presence_of :river_reach
  validates_presence_of :observation_date

#  def display_name 
#    "#{self.id}"
#  end

  def display_name 
    "#{self.river_reach.reach} #{self.observation_date.to_date}"
  end


end
