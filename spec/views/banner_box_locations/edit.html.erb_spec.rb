require 'rails_helper'

RSpec.describe "banner_box_locations/edit", type: :view do
  before(:each) do
    @banner_box_location = assign(:banner_box_location, BannerBoxLocation.create!())
  end

  it "renders the edit banner_box_location form" do
    render

    assert_select "form[action=?][method=?]", banner_box_location_path(@banner_box_location), "post" do
    end
  end
end
