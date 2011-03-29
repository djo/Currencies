require 'spec_helper'

describe Currency do
  subject { Factory :currency }

  it "should be persisted" do
    subject.should be_persisted
  end
end
