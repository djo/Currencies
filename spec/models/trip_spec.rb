require File.dirname(__FILE__) + '/../spec_helper'

describe Trip do
  describe ".dates" do
    it "should return ordered unique completed dates" do
      Factory :trip, :completed_at => Date.today
      Factory :trip, :completed_at => Date.today
      Factory :trip, :completed_at => Date.yesterday
      Factory :trip, :completed_at => (Date.today + 10)

      Trip.dates.should == [Date.yesterday, Date.today, (Date.today + 10)]
    end
  end
end
