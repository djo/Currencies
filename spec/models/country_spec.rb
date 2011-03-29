require 'spec_helper'

describe Country do
  subject { Factory :country }

  it "should be persisted" do
    subject.should be_persisted
  end
end
