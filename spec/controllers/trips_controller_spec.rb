require File.dirname(__FILE__) + '/../spec_helper'

describe TripsController do
  render_views

  before do
    @user = Factory :user
    sign_in @user
  end

  describe "#index" do
    before do
      @trip = Factory :trip, :user => @user
      Factory :country_trip, :trip => @trip
    end

    should_deny_unauthenticated_user { do_request }

    it "should prepare trips" do
      do_request
      assigns(:trips).should == [@trip]
    end

    it "should prepare summary" do
      do_request
      assigns(:summary).should == { 'visited_countries' => 1, 'dates' => [@trip.completed_at] }
    end

    def do_request
      get :index
    end
  end

  describe "#new" do
    should_deny_unauthenticated_user { get(:new) }

    it "should prepare a new trip" do
      get :new
      assigns(:trip).should be_instance_of(Trip)
    end
  end

  describe "#edit" do
    should_deny_unauthenticated_user { do_request }

    it "should redirect if updating is successful" do
      Trip.any_instance.stubs :save => true

      do_request
      response.should redirect_to(trips_url)
    end

    it "should render template if updating isn't successful" do
      Trip.any_instance.stubs :save => false

      do_request
      response.should render_template(:new)
    end

    def do_request
      post :create
    end
  end
end
