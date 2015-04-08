require 'rails_helper'

RSpec.describe "spree/tests/edit", type: :view do
  before(:each) do
    @spree_test = assign(:spree_test, Spree::Test.create!())
  end

  it "renders the edit spree_test form" do
    render

    assert_select "form[action=?][method=?]", spree_test_path(@spree_test), "post" do
    end
  end
end
