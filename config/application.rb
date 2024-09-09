require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module JwtDeviseApp
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.api_only = false
  end
end
