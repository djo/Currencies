class CountriesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_currency_name
  before_filter :build_appointments

  def show
  end

  def update
  end

  private

  def set_currency_name
    @currency_name = params[:id].strip
  end

  def build_appointments
    countries = Country.by_currency_name(@currency_name).includes(:currency)
    appointments = current_user.appointments.by_currency_name(@currency_name).includes(:country => :currency)

    remaining_countries = countries - appointments.map(&:country)
    remaining_appointments = remaining_countries.map { |c| c.appointments.build }

    @appointments = (appointments + remaining_appointments).sort_by { |a| a.country.name }
  end
end
