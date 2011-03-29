require File.dirname(__FILE__) + '/../spec_helper'

describe CountriesController do
  render_views

  let(:currency) { Factory :currency }

  it "index action should render index template" do
    get :index, :currency_id => currency.code
    response.should render_template(:index)
  end
end
