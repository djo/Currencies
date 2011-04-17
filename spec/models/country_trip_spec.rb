require 'spec_helper'

describe CountryTrip do
  it { should belong_to(:country) }
  it { should belong_to(:trip) }

  it { should allow_mass_assignment_of(:country) }

  it { should validate_presence_of(:country_id) }
  it { should validate_presence_of(:trip_id) }

  it { should have_db_index([:country_id, :trip_id]).unique(true) }
end
