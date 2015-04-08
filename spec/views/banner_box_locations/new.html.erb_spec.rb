require 'rails_helper'

RSpec.describe "banner_box_locations/new", type: :view do
  before(:each) do
    assign(:banner_box_location, BannerBoxLocation.new())
  end

  it "renders new banner_box_location form" do
    render

    assert_select "form[action=?][method=?]", banner_box_locations_path, "post" do
    end
  end
end
