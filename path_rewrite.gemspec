$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "path_rewrite/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "path_rewrite"
  s.version     = PathRewrite::VERSION
  s.authors     = ["Michael Tucker"]
  s.email       = ["mtucker@godaddy.com"]
  s.homepage    = "https://github.com/godaddy/path_rewrite"
  s.summary     = "Mountable engine to support dynamic registration of application paths for 301 redirects."
  s.description = "Preserve SEO of your site by redirecting old non-working paths to new active application paths"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "simplecov-rcov"
  s.add_development_dependency "require_all"
end
