class SamplingEvent < ActiveRecord::Base

  belongs_to :river_reach, foreign_key: :river_reaches_id
  has_many :observers
  has_many :sampling_events_observations, foreign_key: :sampling_events_id

  def display_name 
    "#{self.id}"
  end

end
