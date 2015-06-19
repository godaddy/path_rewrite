module PathRewrite
  class PathController < ActionController::Base

    def rewrite
      rewrite = PathTranslation.find_by(old_path: "/#{params["path"]}") or raise ActionController::RoutingError.new("Not Found")

      Rails.logger.debug "Redirecting #{rewrite.old_path} to #{rewrite.new_path} from request #{request.url}"

      redirect_to rewrite.new_path, status: 301
    end

  end
end
# FEATURE FLAG (in nemo)
# TEST/REGRESSION
