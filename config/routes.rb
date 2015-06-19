PathRewrite::Engine.routes.draw do
  get "*path", to: "path#rewrite", constraints: -> (req) do
    PathRewrite.configuration.check_redirect? &&
        PathRewrite::PathTranslation.find_by(old_path: "/#{req.params["path"]}").present?
  end

end
