require 'spec_helper'

describe CountryTrip do
  subject { Factory :country_trip }

  it "should be persisted" do
    subject.should be_persisted
  end
end
