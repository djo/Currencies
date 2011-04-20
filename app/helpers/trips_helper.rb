module TripsHelper
  def countries(trip)
    trip.countries.map(&:name).to_sentence
  end

  def trip_dates(dates)
    dates.map { |d| I18n.l d, :format => :short }.join ' / '
  end
end
