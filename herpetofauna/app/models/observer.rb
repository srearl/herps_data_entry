class Observer < ActiveRecord::Base

  belongs_to :sampling_event
  has_one :river_reach, through: :sampling_event
  belongs_to :person

  def observation_date
    self.sampling_event.observation_date unless self.sampling_event.nil? 
  end

#  not used, employing display_name
#  def initials
#    self.person.initials unless self.person.nil? 
#  end

  def last_name
    self.person.last_name unless self.person.nil? 
  end

  def first_name
    self.person.first_name unless self.person.nil? 
  end

  def display_name 
    "#{self.id}"
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
