class Person < ActiveRecord::Base

  self.table_name = "persons"
  has_many :observers, foreign_key: :person_id

  def display_name 
    "#{self.initials}"
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
