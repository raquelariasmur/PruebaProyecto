require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdministrationModule
  class Application < Rails::Application
    config.load_defaults 7.0

    I18n.load_path += Dir[Rails.root.join("config", "locales", "*.{yml}")]
    I18n.default_locale = :es

    config.time_zone = 'Central America'
    config.active_record.default_timezone = :local

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:4000', 'http://localhost:8100'
        resource '*', headers: :any, methods: :any,
         credentials: true
      end
    end
  end
end
