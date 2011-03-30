module TripsHelper
  def country_check_box_tag(country, country_ids)
    selected = country_ids.include? country.id.to_s
    check_box_tag 'country_ids[]', country.id, selected, :id => dom_id(country)
  end

  def countries(trip)
    trip.countries.map(&:name).to_sentence
  end

  def trip_dates(dates)
    dates.map { |d| I18n.l d, :format => :short }.join ' / '
  end
end
