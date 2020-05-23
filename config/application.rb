require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Todo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Credentials' => 'true',
      'Access-Control-Allow-Origin' => '*' ,
      'Access-Control-Allow-Methods' => 'POST, PUT, DELETE, GET, OPTIONS' ,
      'Access-Control-Request-Method' => '*',
      'Access-Control-Allow-Headers' => 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
