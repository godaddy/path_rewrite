module PathRewrite
  class Engine < ::Rails::Engine
    isolate_namespace PathRewrite

    config.generators do |g|
      g.test_framework :rspec
    end

  end
end
