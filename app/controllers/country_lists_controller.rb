class CountryListsController < ApplicationController
  before_filter :load_currency
  before_filter :load_appointments, :only => :edit

  def edit
  end

  def update
    if @currency.update_attributes params[:currency]
      redirect_to_edit
    else
      load_appointments
      render :edit
    end
  end

  private

  def load_currency
    @currency = Currency.find_by_code params[:currency_id]
  end

  def load_appointments
    @appointments = @currency.appointments.includes :country
  end

  def redirect_to_edit
    redirect_to edit_currency_country_list_path(@currency.code),
                :notice => "Visited country list was changed."
  end
end
