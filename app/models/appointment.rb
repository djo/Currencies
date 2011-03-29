class Appointment < ActiveRecord::Base
  belongs_to :currency
  belongs_to :country

  validates :currency_id, :presence => true, :uniqueness => { :scope => :country_id }
  validates :country_id, :presence => true
end
