class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.with_country_counts.order :name
  end
end
