require File.dirname(__FILE__) + '/../spec_helper'

describe ProfilesController do
  render_views

  before { sign_in Factory(:user) }

  it "edit action should render edit template" do
    get :edit
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    User.any_instance.stubs(:valid?).returns(false)
    put :update
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    put :update
    response.should redirect_to(edit_profile_url)
  end
end
