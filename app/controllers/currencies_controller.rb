class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.order :name
  end
end
