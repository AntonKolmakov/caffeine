# Be sure to restart your server when you modify this file.

Rails.application.configure do
  config.assets.version = '1.0'
  config.assets.precompile += %w( vendor/modernizr.js admin/custom.js admin/custom.css )
  config.assets.precompile += Ckeditor.assets
end
