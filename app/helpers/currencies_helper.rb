module CurrenciesHelper
  def currency_description
    if params[:filter] == 'not_visited'
      render 'currencies/description/not_visited_countries'
    else
      render 'currencies/description/available_currencies'
    end
  end
end
