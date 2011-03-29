require File.dirname(__FILE__) + '/../spec_helper'

describe CountriesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    Currency.create :code => 'USD', :name => 'Dollar'
    get :index, :currency_id => 'USD'
    response.should render_template(:index)
  end
end
