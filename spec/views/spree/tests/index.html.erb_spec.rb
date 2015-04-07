require 'rails_helper'

RSpec.describe "spree/tests/index", type: :view do
  before(:each) do
    assign(:spree_tests, [
      Spree::Test.create!(),
      Spree::Test.create!()
    ])
  end

  it "renders a list of spree/tests" do
    render
  end
end
