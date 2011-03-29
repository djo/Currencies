require File.dirname(__FILE__) + '/../spec_helper'

describe CountryListsController do
  render_views

  let(:currency) { Factory :currency }

  it "edit action should render edit template" do
    get :edit, :currency_id => currency.code
    response.should render_template(:edit)
  end
end
