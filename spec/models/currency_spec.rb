require 'spec_helper'

describe Currency do
  describe ".with_country_counts" do
    before do
      @currency = Factory :currency
      @first_appointment = Factory :appointment, :currency => @currency
      @second_appointment = Factory :appointment, :currency => @currency
    end

    it "should return only currencies of not visited countries" do
      Factory :appointment, :currency => @currency, :visited => true
      Currency.with_country_counts(true).should == [@currency]
    end

    context "should return the currency" do
      specify "with 2 available countries" do
        currency = Currency.with_country_counts(false).first
        currency.available_countries.should == 2
      end

      specify "with 2 not visited countries" do
        not_visited_countries_should_equal 2
      end

      specify "with 1 not visited country" do
        @first_appointment.update_attributes :visited => true
        not_visited_countries_should_equal 1
      end

      specify "with 0 not visited countries" do
        @first_appointment.update_attributes :visited => true
        @second_appointment.update_attributes :visited => true
        not_visited_countries_should_equal nil
      end

      def not_visited_countries_should_equal(count)
        currency = Currency.with_country_counts(false).first
        currency.not_visited_countries.should == count
      end
    end
  end
end
