# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
  
  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store
 
  config.action_controller.session = {
    :session_key => '_windrunner_session ' ,
    :secret => '760223299f1b8939d906c357458c0144ba24c87c6606f841a17991e26777f1c9229d4e7e9d706dd84295258a8e4f1dfd21422a8045a2b26572a3692445b3fb6f'
  }
  
  ## LongPH config
  ## config action_mailer
  #choose delivery method
  config.action_mailer.delivery_method = :smtp
  # enable/disable email delivery
  config.action_mailer.perform_deliveries = true
  # enable/disable email errors saved to log
  config.action_mailer.raise_delivery_errors = false
  # set default character set
  config.action_mailer.default_charset = "utf-8"
  # smtp server configuration
  config.action_mailer.smtp_settings = {
    :enable_starttls_auto => true,
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :domain => 'furious-mist-6456.heroku.com',
    :user_name => 'phanhoanglong2610@gmail.com',
    :password => 'lanphuong2510'
  }

end