require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it { should have_many(:appointments).dependent(:destroy) }
  it { should have_many(:countries).through(:appointments) }
  it { should have_many(:trips).dependent(:destroy) }

  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:remember_me) }
  it { should allow_mass_assignment_of(:appointments_attributes) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
