describe "routes", :type => :routing do

  routes { PathRewrite::Engine.routes }

  before { PathRewrite.configuration.check_redirect = true }

  context "when check_redirect is configured to allow rewrites" do

    context "and a matching route exists" do

      before { PathRewrite::PathTranslation.create!(old_path: "/test", new_path: "/redirected" ) }

      it "routes to path_controller rewrite action" do
        expect(get: "/test").to route_to(controller: "path_rewrite/path", action: "rewrite", path: "test")
      end

    end

    context "and no matching routes exist" do

      it "does not route" do
        expect(get: "/test").not_to be_routable
      end

    end

  end

  context "when check_redirect is configured to disable rewrites" do

    before { PathRewrite.configuration.check_redirect = false }

    context "and a matching route exists" do

      it "does not route" do
        expect(get: "/test").not_to be_routable
      end

    end

    context "and no matching routes exist" do

      it "does not route" do
        expect(get: "/test").not_to be_routable
      end

    end

  end

end