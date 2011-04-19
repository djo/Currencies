require 'spec_helper'

describe Country do
  it { should have_many(:country_trips).dependent(:destroy) }
  it { should have_many(:appointments).dependent(:destroy) }

  it { should belong_to(:currency) }

  it { should allow_mass_assignment_of(:currency) }
  it { should allow_mass_assignment_of(:code) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:currency_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }

  it { should have_db_index(:currency_id) }
  it { should have_db_index(:name) }

  describe ".by_currency_name" do
    it "should return countries by the currency name" do
      dollar = Factory :currency, :name => 'Dollar'
      usa = Factory :country, :currency => dollar
      canada = Factory :country, :currency => dollar
      belgium = Factory :country

      Country.by_currency_name('Dollar').should == [usa, canada]
    end
  end
end
