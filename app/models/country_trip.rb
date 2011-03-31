class CountryTrip < ActiveRecord::Base
  belongs_to :country
  belongs_to :trip

  after_create :mark_appointments

  attr_accessible :country

  validates :country_id, :presence => true, :uniqueness => { :scope => :trip_id }
  validates :trip_id, :presence => true

  private

  def mark_appointments
    Appointment.update_all({ :visited => true }, { :country_id => country_id })
  end
end
