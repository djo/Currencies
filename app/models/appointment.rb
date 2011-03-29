class Appointment < ActiveRecord::Base
  belongs_to :currency
  belongs_to :country

  attr_accessible :visited

  validates :currency_id, :presence => true, :uniqueness => { :scope => :country_id }
  validates :country_id, :presence => true
end
