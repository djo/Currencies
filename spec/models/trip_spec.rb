require File.dirname(__FILE__) + '/../spec_helper'

describe Trip do
  it { should have_many(:country_trips).dependent(:destroy) }
  it { should have_many(:countries).through(:country_trips) }

  it { should belong_to(:user) }

  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:completed_at) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:completed_at) }

  it { should have_db_index(:user_id) }

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
