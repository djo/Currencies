require 'spec_helper'

describe CountryTrip do
  context "[after_create callbacks]" do
    describe "#mark_appointments " do
      before do
        @country = Factory :country
        @first_appointment = Factory :appointment, :country => @country
        @second_appointment = Factory :appointment, :country => @country
        @other_appointment = Factory :appointment
      end

      it "should mark related appointments as visited" do
        Factory :country_trip, :country => @country

        @first_appointment.reload.visited.should be_true
        @second_appointment.reload.visited.should be_true
        @other_appointment.reload.visited.should be_false
      end
    end
  end
end
