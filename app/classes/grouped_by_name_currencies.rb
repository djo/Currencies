module GroupedByNameCurrencies
  # Returns grouped currencies with available country counts
  # And remaining country counts for user
  def grouped_by_name(user = nil, options = {})
    user.blank? ? query : user_query(user, options)
  end

  private

  def user_query(user, options = {})
    # Visited country ids
    country_ids = user.appointments.map &:country_id

    # Grouped currencies with available and remaining country counts for user
    if country_ids.any?
      currencies = with_appointments_query(country_ids)
    else
      currencies = without_appointments_query
    end

    # Currencies only with not visited countries
    if options[:only_remaining]
      currencies = only_remaining_query(currencies)
    end

    currencies
  end

  def with_appointments_query(country_ids)
    query.select('SUM(rc_count) AS remaining_country_count').
          joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) AS rc_count ' +
                                 'FROM countries ' +
                                 "WHERE id NOT IN (#{country_ids.join(',')}) " +
                                 'GROUP BY 1) as rcc ' +
                'ON rcc.currency_id = currencies.id')
  end

  def without_appointments_query
    query.select('SUM(ac_count) AS remaining_country_count')
  end

  def only_remaining_query(currencies)
    currencies.having('remaining_country_count IS NOT NULL')
  end

  def query
    select('name, SUM(ac_count) AS available_country_count').
    joins('INNER JOIN (SELECT currency_id, COUNT(*) AS ac_count
                       FROM countries
                       GROUP BY 1) as acc ' +
          'ON acc.currency_id = currencies.id').
    group('name').
    order('name')
  end
end
