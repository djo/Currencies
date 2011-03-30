module TripsHelper
  def country_check_box_tag(country)
    check_box_tag 'countries[]',
                   country.id,
                   country_selected?(country),
                   :id => dom_id(country)
  end

  def countries(trip)
    trip.countries.map(&:name).to_sentence
  end

  private

  def country_selected?(country)
    params[:countries].include? country.id.to_s
  end
end
