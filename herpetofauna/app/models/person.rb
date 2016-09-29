class Person < ActiveRecord::Base

  self.table_name = "persons"
  belongs_to :observer, foreign_key: :person_id

  def display_name 
    "#{self.initials}"
  end

#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
