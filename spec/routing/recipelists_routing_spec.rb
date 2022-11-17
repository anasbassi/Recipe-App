require "rails_helper"

RSpec.describe RecipelistsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/recipelists").to route_to("recipelists#index")
    end

    it "routes to #new" do
      expect(get: "/recipelists/new").to route_to("recipelists#new")
    end

    it "routes to #show" do
      expect(get: "/recipelists/1").to route_to("recipelists#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/recipelists/1/edit").to route_to("recipelists#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/recipelists").to route_to("recipelists#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/recipelists/1").to route_to("recipelists#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/recipelists/1").to route_to("recipelists#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/recipelists/1").to route_to("recipelists#destroy", id: "1")
    end
  end
end
