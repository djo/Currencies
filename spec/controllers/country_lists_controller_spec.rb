require File.dirname(__FILE__) + '/../spec_helper'

describe CountryListsController do
  render_views

  let(:currency) { Factory :currency }

  it "index action should render show template" do
    get :show, :currency_id => currency.code
    response.should render_template(:show)
  end
end
