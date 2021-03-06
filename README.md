PathRewrite
===========

Define application route rewrites with a dynamically configured data persistence. This is largely intended as an SEO preservation
mechanism, so that you can rewrite your application paths and have old indexes redirected to the new location automatically.

## Installation

Add this line to your application's Gemfile:

    gem 'path_rewrite'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install path_rewrite

## Usage

In your routes.rb file, mount the engine:

    mount PathRewrite::Engine, at: "/"
    
***Make sure you mount this engine as the very last entry, or you will override valid paths!***

You can then register path translations in rails console or your own script. 
Currently, there is no user interface to accomplish this task.

    PathRewrite::PathTranslation.create!(old_path: "/old/application/url", new_path: "/new/app_url")

## Disable URL Rewrites

A configuration setting is available to globally enable or disable these translations. The setting accepts a static 
value or a lambda, allowing you to decide whether the translation route kicks in on a per-request basis.

    PathRewrite.configuration.check_redirect = false # globally disabled

or

    PathRewrite.configuration.check_redirect = -> (request) { magical_decision_making_logic_here } # dynamically enable based on request info or other logic

This configuration value can be checked as well, which will return a static value or evaluate the lambda.

    PathRewrite.configuration.check_redirect?

## Contributing

1. Fork it ( https://github.com/godaddy/path_rewrite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
