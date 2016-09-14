class Person < ActiveRecord::Base

  belongs_to :observer

# this controls the "header" when you click on an entry
#  def display_name 
#    "#{self.observation_date.to_date}"
#  end

end
