class CountriesController < ApplicationController
  before_filter :load_currency

  def index
    @countries = @currency.countries
  end

  private

  def load_currency
    @currency = Currency.find_by_code params[:currency_id]
  end
end
