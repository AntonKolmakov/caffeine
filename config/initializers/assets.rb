# Be sure to restart your server when you modify this file.

Rails.application.configure do
  config.assets.version = '1.2'
  config.assets.precompile += 'vendor/modernizr.js'
  config.assets.precompile += %w(admin/admin.js admin/admin.css) # admin backend assets
  config.assets.precompile += %w(admin/login/login.js admin/login/login.css) # admin login assets
  config.assets.precompile += Ckeditor.assets
end
