module NavigationHelper
  def currency_pages_class
    if ['currencies', 'countries'].include? controller_name
      'active'
    end
  end

  def trip_pages_class
    'active' if controller_name == 'trips'
  end

  def profile_pages_class
    'active' if controller_name == 'registrations'
  end
end
