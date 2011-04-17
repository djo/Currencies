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
end
