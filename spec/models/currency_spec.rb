require 'spec_helper'

describe Currency do
  it { should have_many(:countries).dependent(:destroy) }

  it { should allow_mass_assignment_of(:code) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:code) }

  it { should have_db_index(:name) }
end
