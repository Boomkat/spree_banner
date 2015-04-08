require "rails_helper"

RSpec.describe BannerBoxLocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/banner_box_locations").to route_to("banner_box_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/banner_box_locations/new").to route_to("banner_box_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/banner_box_locations/1").to route_to("banner_box_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/banner_box_locations/1/edit").to route_to("banner_box_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/banner_box_locations").to route_to("banner_box_locations#create")
    end

    it "routes to #update" do
      expect(:put => "/banner_box_locations/1").to route_to("banner_box_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/banner_box_locations/1").to route_to("banner_box_locations#destroy", :id => "1")
    end

  end
end
