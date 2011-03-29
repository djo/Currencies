require 'spec_helper'

describe Appointment do
  subject { Factory :appointment }

  it "should be persisted" do
    subject.should be_persisted
  end
end
