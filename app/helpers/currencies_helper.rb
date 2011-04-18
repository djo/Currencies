module CurrenciesHelper
  def currency_description
    if action_name == 'remaining'
      render 'currencies/description/not_visited_countries'
    else
      render 'currencies/description/available_currencies'
    end
  end
end
