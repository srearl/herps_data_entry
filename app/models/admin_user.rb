class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable

  validates_presence_of :username
  validates_uniqueness_of :username

  
end
