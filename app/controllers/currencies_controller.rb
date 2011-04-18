class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.grouped_by_name current_user
  end
end
