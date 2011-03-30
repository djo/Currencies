class TripsController < ApplicationController
  before_filter :build_country_ids, :only => [:new, :create]

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

  def build_country_ids
    @country_ids = Array(params[:country_ids])
  end

  def add_countries
    @country_ids.each do |id|
      country = Country.find id
      @trip.country_trips.create :country => country
    end
  end
end
