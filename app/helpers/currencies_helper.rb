module CurrenciesHelper
  def currency_description
    if action_name == 'remaining'
      render 'currencies/description/not_visited_countries'
    else
      render 'currencies/description/available_currencies'
    end
  end

  def countries_link(currency_name, label)
    if user_signed_in?
      link_to label, country_path(currency_name)
    else
      label
    end
  end
end
