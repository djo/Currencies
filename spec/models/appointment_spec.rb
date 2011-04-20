require File.dirname(__FILE__) + '/../spec_helper'

describe Appointment do
  it { should belong_to(:country) }
  it { should belong_to(:user) }

  it { should allow_mass_assignment_of(:country_id) }

  it { should validate_presence_of(:country_id) }
  it { should validate_presence_of(:user_id) }

  it { should have_db_index([:country_id, :user_id]).unique(true) }

  describe ".by_currency_name" do
    it "should return appointments by the currency name" do
      user = Factory :user
      dollar = Factory :currency, :name => 'Dollar'

      usa = Factory :country, :currency => dollar
      canada = Factory :country, :currency => dollar
      belgium = Factory :country

      usa_appointment = Factory :appointment, :user => user, :country => usa
      canada_appointment = Factory :appointment, :user => user, :country => canada
      belgium_appointment = Factory :appointment, :user => user, :country => belgium

      Appointment.by_currency_name('Dollar').should == [usa_appointment, canada_appointment]
    end
  end
end
