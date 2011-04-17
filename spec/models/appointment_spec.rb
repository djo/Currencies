require 'spec_helper'

describe Appointment do
  it { should belong_to(:country) }
  it { should belong_to(:user) }

  it { should allow_mass_assignment_of(:country_id) }

  it { should validate_presence_of(:country_id) }
  it { should validate_presence_of(:user_id) }

  it { should have_db_index([:country_id, :user_id]).unique(true) }
end
