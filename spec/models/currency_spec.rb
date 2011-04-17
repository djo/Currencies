require 'spec_helper'

describe Currency do
  it { should have_many(:countries).dependent(:destroy) }

  it { should allow_mass_assignment_of(:code) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }

  it { should have_db_index(:name) }

  describe ".grouped_by_name" do
    before do
      @dollar1 = Factory :currency, :name => 'Dollar'
      @dollar2 = Factory :currency, :name => 'Dollar'
      @euro = Factory :currency, :name => 'Euro'

      Factory :country, :currency => @dollar1
      Factory :country, :currency => @dollar1
      Factory :country, :currency => @dollar2
      Factory :country, :currency => @euro
    end

    it "should return grouped currencies with country counts" do
      dollar, euro = Currency.grouped_by_name

      dollar.name.should == 'Dollar'
      dollar.country_count.should == 3

      euro.name.should == 'Euro'
      euro.country_count.should == 1
    end
  end
end
