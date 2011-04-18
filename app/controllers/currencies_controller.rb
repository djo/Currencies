class CurrenciesController < ApplicationController
  before_filter :authenticate_user!, :only => :remaining

  def index
    @currencies = Currency.grouped_by_name current_user
  end

  def remaining
    @currencies = Currency.grouped_by_name current_user, :only_remaining => true
  end
end
