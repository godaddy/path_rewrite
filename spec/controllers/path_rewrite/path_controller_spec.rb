module PathRewrite
  RSpec.describe PathController, type: :controller do

    # ensure requests use the engine route. alternative is to specify use_route: "path_rewrite" in every test
    routes { PathRewrite::Engine.routes }

    context "when a translation matches the request path" do

      let(:old_path) { "test" }
      let(:new_path) { "/captured" }

      before { PathRewrite::PathTranslation.create!(old_path: "/#{old_path}", new_path: "#{new_path}") }

      it "redirects 301 to new path" do
        get :rewrite, path: old_path
        expect(response).to redirect_to new_path
      end

    end

    context "when no translations match the request path" do

      it "raises routing error" do
        expect { get :rewrite, path: "non_translated_path" }.to raise_error ActionController::RoutingError
      end

    end

  end
end
