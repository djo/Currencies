module NavigationHelper
  def currency_pages_class
    if ['currencies', 'country_lists'].include? controller_name
      'active'
    end
  end

  def trip_pages_class
    'active' if controller_name == 'trips'
  end

  def profile_pages_class
    'active' if controller_name == 'profiles'
  end
end
