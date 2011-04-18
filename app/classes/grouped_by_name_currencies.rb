module GroupedByNameCurrencies
  # Returns grouped currencies with available country counts
  # And remaining country counts for user
  def grouped_by_name(user = nil, options = {})
    if user
      grouped_by_name_for_user(user, options)
    else
      grouped_by_name_query
    end
  end

  private

  def grouped_by_name_for_user(user, options = {})
    # Visited countries ids
    country_ids = user.appointments.map &:country_id

    # Grouped currencies with available and remaining country counts for user
    currencies = grouped_by_name_query.
        select('SUM(rc_count) AS remaining_country_count').
        joins('LEFT OUTER JOIN (SELECT currency_id, COUNT(*) AS rc_count ' +
                               'FROM countries ' +
                               "WHERE id NOT IN (#{country_ids.join(',')}) " +
                               'GROUP BY 1) as rcc ' +
              'ON rcc.currency_id = currencies.id')

    # Return currencies only with not visited countries
    if options[:only_remaining]
      currencies = currencies.having('remaining_country_count != available_country_count')
    end

    currencies
  end

  def grouped_by_name_query
    select('name, SUM(ac_count) AS available_country_count').
    joins('INNER JOIN (SELECT currency_id, COUNT(*) AS ac_count
                       FROM countries
                       GROUP BY 1) as acc ' +
          'ON acc.currency_id = currencies.id').
    group('name').
    order('name')
  end
end
