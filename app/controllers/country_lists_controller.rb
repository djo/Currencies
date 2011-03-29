class CountryListsController < ApplicationController
  before_filter :load_currency

  def show
    @countries = @currency.countries
  end

  private

  def load_currency
    @currency = Currency.find_by_code params[:currency_id]
  end
end
