class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.with_country_counts only_not_visited?
  end

  private

  def only_not_visited?
    params[:filter] == 'not_visited'
  end
end
