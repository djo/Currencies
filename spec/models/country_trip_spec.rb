require File.dirname(__FILE__) + '/../spec_helper'

describe CountryTrip do
  it { should belong_to(:country) }
  it { should belong_to(:trip) }

  it { should allow_mass_assignment_of(:country_id) }

  it { should validate_presence_of(:country_id) }

  it { should have_db_index([:country_id, :trip_id]).unique(true) }

  describe ".country_count" do
    it "should return trip country count for user" do
      user = Factory :user
      country = Factory :country
      first_trip = Factory :trip, :user => user
      second_trip = Factory :trip, :user => user

      Factory :country_trip
      Factory :country_trip, :country => country, :trip => first_trip
      Factory :country_trip, :country => country, :trip => second_trip

      CountryTrip.country_count(user).should == 1
    end
  end
end

