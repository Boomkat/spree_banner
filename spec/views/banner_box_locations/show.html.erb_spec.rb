require 'rails_helper'

RSpec.describe "banner_box_locations/show", type: :view do
  before(:each) do
    @banner_box_location = assign(:banner_box_location, BannerBoxLocation.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
