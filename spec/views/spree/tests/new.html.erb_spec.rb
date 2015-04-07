require 'rails_helper'

RSpec.describe "spree/tests/new", type: :view do
  before(:each) do
    assign(:spree_test, Spree::Test.new())
  end

  it "renders new spree_test form" do
    render

    assert_select "form[action=?][method=?]", spree_tests_path, "post" do
    end
  end
end
