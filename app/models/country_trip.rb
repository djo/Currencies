class CountryTrip < ActiveRecord::Base
  belongs_to :country, :inverse_of => :country_trips
  belongs_to :trip

  attr_accessible :country_id

  validates :country_id, :presence => true,
                         :uniqueness => { :scope => :trip_id }

  after_create :create_appointment

  private

  def create_appointment
    appointment = Appointment.new
    appointment.user = trip.user
    appointment.country = country
    appointment.save
  end
end
