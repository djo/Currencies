require File.dirname(__FILE__) + '/../spec_helper'

describe CountriesController do
  render_views

  before do
    @user = Factory :user
    sign_in @user
  end

  describe "#show" do
    should_deny_unauthenticated_user { do_request }

    it "should prepare currency name" do
      do_request
      assigns(:currency_name).should == 'Dollar'
    end

    it "should prepare appointments" do
      dollar = Factory :currency, :name => 'Dollar'
      usa = Factory :country, :name => 'USA', :currency => dollar
      canada = Factory :country, :name => 'Canada', :currency => dollar
      usa_appointment = Factory :appointment, :user => @user, :country => usa

      do_request
      assigns(:appointments).should have(2).items
      assigns(:appointments).first.should be_new_record
      assigns(:appointments).first.country.should == canada
      assigns(:appointments).second.should == usa_appointment
    end

    def do_request
      get :show, :id => 'Dollar'
    end
  end

  describe "#edit" do
    should_deny_unauthenticated_user { do_request }

    it "should redirect if updating is successful" do
      User.any_instance.stubs :update_attributes => true

      do_request
      response.should redirect_to(country_url('Dollar'))
    end

    it "should render template if updating isn't successful" do
      User.any_instance.stubs :update_attributes => false

      do_request
      response.should render_template(:show)
    end

    def do_request
      put :update, :id => 'Dollar'
    end
  end
end
