# THIS IS OLD README
# WE ARE GOING TO UPDATE THIS ONE

[ ![Codeship Status for fishtag/Caffeine CMS](https://codeship.io/projects/5b34caa0-4718-0132-2b1b-16dc934441f8/status)](https://codeship.io/projects/45475)
# Skeleton for new Rails 4 based application

Application currently based on Rails 4 stable branch and Ruby 2.1.3

## Application gems:

* [Sass Rails](https://github.com/rails/sass-rails) Ruby on Rails stylesheet engine for Sass
* [Autoprefixer](https://github.com/ai/autoprefixer-rails) for writing CSS without vendor prefixes
* [Slim](https://github.com/stonean/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) for DRY controllers
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification

## Development gems

* [Thin](https://github.com/macournoyer/thin) as rails web server
* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for preview mail in the browser instead of sending
* [Mail Safe](https://github.com/myronmarston/mail_safe) keep ActionMailer emails from escaping into the wild during development
* [Bullet](https://github.com/flyerhzm/bullet) gem to kill N+1 queries and unused eager loading
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) code metric tool
* [Brakeman](https://github.com/presidentbeef/brakeman) static analysis security vulnerability scanner
* [Pry Rails](https://github.com/rweng/pry-rails) is an alternative to the standard IRB shell for Ruby

## Testing gems

* Turnip, Capybara, and Capybara Webkit for integration testing, including JavaScript behavior
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for easier creation of test data
* [RSpec](https://github.com/rspec/rspec) for awesome, readable isolation testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for frequently needed Rails and RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) Collection of rspec matchers and cucumber steps for testing emails


## Initializes

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `time_formats.rb` - setup default time formats, so you can use them like object.create_at.to_s(:us_time)
* `requires.rb` - automatically requires everything in lib/ & lib/extensions

## Scripts

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - runs brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Quick start
  1. `git clone git@bitbucket.org:fishtag/caffeine-cms.git`
  2. `cd caffeine-cms`
  3. `bin/bootstrap`
  4. `echo 'port: 10000' > .foreman` 
  5. Run app - `foreman start`
