require "rails_helper"

RSpec.describe Spree::TestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spree/tests").to route_to("spree/tests#index")
    end

    it "routes to #new" do
      expect(:get => "/spree/tests/new").to route_to("spree/tests#new")
    end

    it "routes to #show" do
      expect(:get => "/spree/tests/1").to route_to("spree/tests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/spree/tests/1/edit").to route_to("spree/tests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spree/tests").to route_to("spree/tests#create")
    end

    it "routes to #update" do
      expect(:put => "/spree/tests/1").to route_to("spree/tests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spree/tests/1").to route_to("spree/tests#destroy", :id => "1")
    end

  end
end
