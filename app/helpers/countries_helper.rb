module CountriesHelper
  def appointment_check_box_options(appointment)
    [{ :checked => appointment.persisted? }, appointment.country_id, '']
  end

  def country_label(country)
    "#{h country.name} #{content_tag :span, h(country.currency.code)}".html_safe
  end
end
