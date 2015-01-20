source 'https://rubygems.org'

# Specify ruby version for Heroku
ruby '2.1.3'

# Core gems
gem 'rails'
gem 'rails-i18n'
gem 'puma' # multithreaded concurent web-server
gem 'pg' # Default DB engine
gem 'json'

# Asset gems
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'compass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-fileupload-rails'
gem 'jquery-ui-rails'
gem 'premailer-rails'
gem 'font-awesome-sass', '~> 4.2.0'

# Validation gems
gem 'validates_email_format_of' # validate email format for field
gem 'phony_rails' # validate and normalize phone numbers

# Gems for easy developing
gem 'seedbank' # For envirnoment-specific seeds
gem 'nested_form' # for building and updating associations through forms
gem 'devise' # Authenticate users
gem 'simple_form', github: 'plataformatec/simple_form', tag: 'v3.1.0.rc2' # For easy view forms
gem 'decent_exposure' # For DRYing controllers
gem 'kaminari' # Object paginations
gem 'slim' # View template engine
gem 'simple-navigation'
gem 'closure_tree' # tree data structure
gem 'responders'
gem 'carrierwave' # flexible way to upload files
gem 'mini_magick'
gem 'friendly_id'
gem 'draper'
gem 'babosa'
gem 'ckeditor' # HTML text editor
gem 'font_assets' # Properly serve fonts - MIME-types and CORS config
gem 'acts_as_list' # For sorting pages' children
gem 'gretel' # breadcrumbs generator
gem 'kramdown', require: false

group :development do
  gem 'quiet_assets'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
  gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'spring' # preload instances
  gem 'traceroute' # seek for unused routes
  gem 'rack-mini-profiler', require: false # profiler for rack applications
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'mail_safe'
  gem 'pry-byebug'
end

group :test do
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'rspec-mocks'
  gem 'simplecov', require: false
  gem 'webmock', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'minitest'
  gem 'shoulda-matchers'
  gem 'turnip'
  gem 'selenium-webdriver'
  gem 'codeclimate-test-reporter', require: false
  gem 'rspec-activemodel-mocks'

  gem 'pronto'
  gem 'pronto-rubocop', require: false
  gem 'pronto-brakeman', require: false
  gem 'pronto-scss', require: false
  gem 'pronto-coffeelint', require: false
  gem 'pronto-poper', require: false
  gem 'pronto-flay', require: false

  gem 'flog', require: false
  gem 'reek', require: false
end

group :staging, :production do
  gem 'rails_12factor'
  gem 'fog'
end

group :production do
  gem 'newrelic_rpm'
end
