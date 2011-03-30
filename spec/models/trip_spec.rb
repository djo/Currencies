require File.dirname(__FILE__) + '/../spec_helper'

describe Trip do
  subject { Factory :trip }

  it "should be persisted" do
    subject.should be_persisted
  end
end
