require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myblog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = [:'zh-CN', :en]
    # config.i18n.default_locale = (ENV['LOCALE'] || 'zh-CN').to_sym
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
