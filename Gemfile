source 'https://rubygems.org'

# Specify ruby version for Heroku
ruby '2.1.0'

# Core gems
gem 'rails'
gem 'rails-i18n'
gem 'puma' # multithreaded concurent web-server
gem 'pg' # Default DB engine
gem 'json'

# Asset gems
gem 'sass-rails'
gem 'foundation-rails'
gem 'compass-rails'
gem 'foundation-icons-sass-rails'
gem 'jquery-rails'
gem 'coffee-rails'
gem 'uglifier'

# Validation gems
gem 'validates_email_format_of' # validate email format for field
gem 'phony_rails' # validate and normalize phone numbers

# Gems for easy developing
gem 'seedbank' # For envirnoment-specific seeds
gem 'nested_form' # for building and updating associations through forms
gem 'devise' # Authenticate users
gem 'simple_form' # For easy view forms
gem 'decent_exposure' # For DRYing controllers
gem 'kaminari' # Object paginations
gem 'slim' # View template engine
gem 'simple-navigation'

group :development do
  gem 'styleguides'
  gem 'quiet_assets'
  gem 'letter_opener'
  gem 'slim-rails'
  gem 'foreman'
  gem 'bullet'
  gem 'mail_safe'
  gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'spring' # preload instances
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'fuubar'
  gem 'rspec-rails'
  gem 'rails_best_practices'
  gem 'brakeman', require: false
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'webmock', require: false
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'minitest'
  gem 'shoulda-matchers'
  gem 'turnip'
end

group :staging, :production do
  gem 'rails_12factor'
end
