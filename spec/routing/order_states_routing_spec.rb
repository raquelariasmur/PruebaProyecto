require "rails_helper"

RSpec.describe OrderStatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/order_states").to route_to("order_states#index")
    end

    it "routes to #new" do
      expect(get: "/order_states/new").to route_to("order_states#new")
    end

    it "routes to #show" do
      expect(get: "/order_states/1").to route_to("order_states#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/order_states/1/edit").to route_to("order_states#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/order_states").to route_to("order_states#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/order_states/1").to route_to("order_states#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/order_states/1").to route_to("order_states#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/order_states/1").to route_to("order_states#destroy", id: "1")
    end
  end
end
