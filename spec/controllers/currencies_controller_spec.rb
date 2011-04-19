require File.dirname(__FILE__) + '/../spec_helper'

describe CurrenciesController do
  render_views

  describe "#index" do
    it "should prepare currencies" do
      expected = stub(:each => [])
      Currency.expects(:grouped_by_name).returns expected

      get :index
      assigns(:currencies).should == expected
    end
  end

  describe "#remaining" do
    should_deny_unauthenticated_user { get :remaining }

    it "should prepare currencies" do
      @user = Factory :user
      sign_in @user

      expected = stub(:each => [])
      Currency.expects(:grouped_by_name).with(@user, :only_remaining => true).returns expected

      get :remaining
      assigns(:currencies).should == expected
    end
  end
end
