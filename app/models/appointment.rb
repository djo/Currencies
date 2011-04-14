class Appointment < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  attr_accessible

  validates :country_id, :presence => true, :uniqueness => { :scope => :user_id }
  validates :user_id, :presence => true
end
