require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Caffeine
  class Application < Rails::Application

    config.middleware.use Rack::Deflater

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    # Application specific options
    #
    # Name used in the html titles and mailers
    config.app_name = 'Caffeine'

    config.responders.flash_keys = [ :notice, :warning ]

    # Slim engine default option, initializers/slim.rb
    config.slim_options = {}

    # Default e-mail address which will be shown in the "from" devise emails, initializers/devise.rb,
    config.noreply = 'noreply@caffeine-cms.com'

    # Default host for action mailer, initializers/mailer.rb
    config.host = 'localhost:10000'

    # Autoload ckeditor models folder
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    config.before_initialize do
      config.font_assets.origin = ['http://', config.host].join
      config.action_mailer.asset_host = ['http://', config.action_controller.asset_host].join
      config.action_mailer.default_url_options = { host: config.host }
    end
  end
end
