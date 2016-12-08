class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable

  validates_presence_of :username
  validates_uniqueness_of :username

  before_save :generate_email

  def generate_email
    self.email = "#{username}@asu.edu"
  end
  
end
