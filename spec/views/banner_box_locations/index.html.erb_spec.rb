require 'rails_helper'

RSpec.describe "banner_box_locations/index", type: :view do
  before(:each) do
    assign(:banner_box_locations, [
      BannerBoxLocation.create!(),
      BannerBoxLocation.create!()
    ])
  end

  it "renders a list of banner_box_locations" do
    render
  end
end
