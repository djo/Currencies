class TripsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :prepare_summary, :only => :index
  before_filter :build_country_trips, :only => [:new, :create]

  def index
    @trips = current_user.trips.includes :countries
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.build params[:trip]

    if @trip.save
      redirect_to trips_url, :notice => "Trip successfully added."
    else
      render :action => 'new'
    end
  end

  private

  def prepare_summary
    @summary = { :visited_countries => CountryTrip.country_count(current_user),
                 :dates => Trip.dates(current_user) }
  end

  def build_country_trips
    @country_trips = Country.all.map { |c| c.country_trips.build }
  end
end
