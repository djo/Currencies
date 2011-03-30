class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(params[:trip])
    if @trip.save
      redirect_to trips_url, :notice => "Trip was created."
    else
      render :action => 'new'
    end
  end
end
