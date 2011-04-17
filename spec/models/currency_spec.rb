require 'spec_helper'

describe Currency do
  it { should have_many(:countries).dependent(:destroy) }

  it { should allow_mass_assignment_of(:code) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }

  it { should have_db_index(:name) }

  context "[grouped by name]" do
    before do
      @user = Factory :user

      dollar1 = Factory :currency, :name => 'Dollar'
      dollar2 = Factory :currency, :name => 'Dollar'
      euro = Factory :currency, :name => 'Euro'

      @usa = Factory :country, :currency => dollar1
      @canada = Factory :country, :currency => dollar2
      @belgium = Factory :country, :currency => euro
    end

    describe ".grouped_by_name" do
      it "should return grouped currencies with available country counts" do
        dollar, euro = Currency.grouped_by_name

        dollar.name.should == 'Dollar'
        dollar.available_country_count.should == 2

        euro.name.should == 'Euro'
        euro.available_country_count.should == 1
      end
    end

    describe ".grouped_by_name_for" do
      it "should return grouped currencies with available and remaining country counts" do
        @user.countries << @usa

        dollar, euro = Currency.grouped_by_name_for(@user)

        dollar.name.should == 'Dollar'
        p dollar.available_country_count
        dollar.available_country_count.should == 2
        dollar.remaining_country_count.should == 1

        euro.name.should == 'Euro'
        euro.available_country_count.should == 1
        dollar.remaining_country_count.should == 1
      end
    end
  end
end
