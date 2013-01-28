require "spec_helper"

describe EventTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_times").should route_to("event_times#index")
    end

    it "routes to #new" do
      get("/event_times/new").should route_to("event_times#new")
    end

    it "routes to #show" do
      get("/event_times/1").should route_to("event_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_times/1/edit").should route_to("event_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_times").should route_to("event_times#create")
    end

    it "routes to #update" do
      put("/event_times/1").should route_to("event_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_times/1").should route_to("event_times#destroy", :id => "1")
    end

  end
end
