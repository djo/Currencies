class TripsController < ApplicationController
  def index
    @trips = Trip.includes :countries
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new params[:trip]

    if @trip.save
      add_countries
      redirect_to trips_url, :notice => "Trip was added."
    else
      render :action => 'new'
    end
  end

  private

  def add_countries
    country_ids = Array(params[:countries])

    country_ids.each do |id|
      country = Country.find id
      @trip.country_trips.create :country => country
    end
  end
end
