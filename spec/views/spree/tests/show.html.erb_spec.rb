require 'rails_helper'

RSpec.describe "spree/tests/show", type: :view do
  before(:each) do
    @spree_test = assign(:spree_test, Spree::Test.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
