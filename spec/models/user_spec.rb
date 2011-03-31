require 'spec_helper'

describe User do
  subject { Factory :user }

  it "should be persisted" do
    subject.should be_persisted
  end
end
