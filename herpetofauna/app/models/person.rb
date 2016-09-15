class Person < ActiveRecord::Base

  self.table_name = "persons"
  belongs_to :observer

  def display_name 
    "#{self.initials}"
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
