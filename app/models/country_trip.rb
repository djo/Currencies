class CountryTrip < ActiveRecord::Base
  belongs_to :country
  belongs_to :trip

  attr_accessible

  validates :country_id, :presence => true, :uniqueness => { :scope => :trip_id }
  validates :trip_id, :presence => true
end
